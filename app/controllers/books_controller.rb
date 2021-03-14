class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
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
       redirect_to book_path(@book)
       flash[:notice] = "Book was successfully updated."
    else
      render :edit
    end
  end

  def create
     @book = Book.new(book_params)
     if @book.save
        redirect_to book_path(@book.id)
        flash[:notice] = "Book was successfully created."
     else
        @books = Book.all
        render :index
     end
  end

  def destroy
     book = Book.find(params[:id]) #データ（レコード）を１件取得
     book.destroy #データ（レコード）を削除
     redirect_to books_path #投稿一覧・新規登録のindexページへリダイレクト
  end


  private #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title,:body)
  end

end
