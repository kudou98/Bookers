class BooksController < ApplicationController


  def create
    @books = Book.all
    @book = Book.new(book_params)
       if @book.save
         flash[:complete] = "successfully"
         redirect_to book_path(@book)
       else
         render :index
       end
  end

  def index
    @books = Book.all
    @book = Book.new #新規投稿の部分テンプレート
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
       if @book.update(book_params)
  	     flash[:complete]="successfully"
  	     redirect_to book_path(@book)
  	 　else
  	     
  	     render :edit
       end
  end

  def destroy
    book = Book.find(params[:id])  #データを１件取得
    book.destroy  #データを削除
    flash[:complete]="Book was successfully destroyed."
    redirect_to books_path  #投稿一覧画面へリダイレクトs
  end


  private #ストロングパラメータ

  def book_params
    params.require(:book).permit(:title,:body)
  end
end
