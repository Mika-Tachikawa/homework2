class BooksController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @book = Book.new
  end

  def create
    #バリデーションチェック記述のため、下記５行不要
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    #book = Book.new(book_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    #book.save
    # 4. トップ画面へリダイレクト
    #redirect_to book_path(book.id)
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
      #flash[:notice] = "Book was successfully created"
      #redirect_to book_path(book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def index
    #インスタンス変数、booksはBookテーブル内の情報全て
    @books = Book.all
    #indexにnew（投稿画面）を書き加えたので、下記追加
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    #バリデーションチェック記述のため、下記３行不要
    #book = Book.find(params[:id])
    #book.update(book_params)
    #redirect_to book_path(book.id)
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice2] = "Book was successfully updated."
      redirect_to book_path(@book.id)
      #flash[:notice] = "Book was successfully created"
      #redirect_to book_path(book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    flash[:notice3] = "Book was successfully destroyed."
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
