-- Книги 'book'
CREATE TABLE book (
    id_book serial PRIMARY KEY, -- Уникальный идентификатор книги
    title text, -- Название
    autors text, -- Автор(ы)
    public_year integer, -- Год издания
    page_count integer, -- Объем (в страницах)
    price integer, -- Цена
    books_count integer, -- Количество экземпляров в фонде
    id_editor serial REFERENCES editor (id_editor) -- издатель (id_editor)
);

-- Читатели 'user'
CREATE TABLE user (
    id_user serial PRIMARY KEY, -- Номер читательского билета(id_user)
    user_name text, -- Полное имя читателя
    user_address text, -- Адрес читателя
    user_phone integer -- Телефон читателя
);

-- Издательства 'editor'
CREATE TABLE editor (
    id_editor serial PRIMARY KEY, -- Уникальный идентификатор издательства
    editor_name text, -- Название издательства
    editor_city text -- Город издательства
);

-- Авторы 'autors'
CREATE TABLE autors (
    id_autors serial PRIMARY KEY, -- Уникальный идентификатор автора
    autors_name text -- Имя автора
);

-- Издание 'edition'
CREATE TABLE edition (
    id_edition serial PRIMARY KEY, -- Уникальный идентификатор издания книги
	id_autors serial REFERENCES autors (id_autors) , -- Уникальный идентификатор автора
	id_book	serial REFERENCES book (id_book)  -- Уникальный идентификатор книги
);

-- рееатр выдачи заказов 'order'
CREATE TABLE order (
    id_order serial PRIMARY KEY, -- Уникальный идентификатор выдачи заказа
    id_user serial REFERENCES user (id_user), -- Номер читательского билета(id_user)
    id_book	serial REFERENCES book (id_book)  -- Уникальный идентификатор книги
);
