class BooksController < ApplicationController
  def new
    @book = Book.new #空のモデルオブジェクトを@bookに格納してviewに受け渡す
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      return redirect_to book_path(@book.id), notice: "Book was successfully created."
    else
      @books = Book.all
      render '/books/index'
    end
  end
  
  def index
    @books = Book.all #一覧を表示するため、全てのデータを取得して@booksに格納
    @book=Book.new
  end

  def show
    @book = Book.find(params[:id]) #これは、urlがbooks/13の時、Book.find(13)と同じ意味
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      return redirect_to book_path(@book.id), notice: "Book was successfully updated."
    else
      render '/books/edit'
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    if book.destroy
      return redirect_to "/books", notice: "Book was successfully destroyed."
    end
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
