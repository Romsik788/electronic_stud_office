# Electronic Student Office

Електронна система для оцінювання студентів.

## Встановлення

Необхідно інсталювати Python 3.10 та вище. Дана система використовує залежності Django та mysqlclient, тому їх необхідно встановити якщо вони не встановлені до цього.

```bash
pip install django mysqlclient
```
Тепер необхідно встановити саму систему, якщо встановлений git то можна командою
```bash
git clone https://github.com/Romsik788/electronic_stud_office
```
Або архів за [посиланням](https://github.com/Romsik788/electronic_stud_office/archive/refs/heads/main.zip) який потім необхідно розпакувати
## Використання

Перед запуском Django сервера, необхідно зробити наступне:

1. Імпортувати файл бази даних **electronic_student_office.sql** на сервер MySQL. Рекомендуємо використовувати MySQL 8.0 та вище. В якості сервера можна використовувати [OpenServer](https://ospanel.io/).
2. Створити суперкористувача Django, який зможе керувати всією системою та взаємодіяти з БД через адмін-панель. Для створення необхідно зайти в папку проекта (в ній має бути файл **manage.py**) та виконати наступну команду та виконати подальші вказівки
```bash
python manage.py createsuperuser
```
3. Тепер необхідно вказати Django шлях до БД. Для цього необхідно відкрити файл [settings.py](elecoffice/settings.py) та знайти наступний код
```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'electronic_student_office',
        'USER': 'root',
        'PASSWORD': '',
        'HOST': '127.0.0.1',
        'PORT': '3306',
    }
}
```
Дані поля необхідні для доступну до БД, і їх необхідно змінити під ваші налаштування.

**NAME** - назва бази даних. По замовчуванню коли ви імпортуєте це *electronic_stud_office*

**USER** та **PASSWORD** - ім'я та пароль користувача. Тут потрібно вказати ім'я та пароль користувача, який матиме доступ на вашому MySQL сервері до бази даних *electronic_stud_office*

**HOST** та **PORT** - Адреса та порт вашого MySQL сервера.

4. Запустити Django сервер
```bash
python manage.py runserver
```

## Внесок
Запити на виправлення вітаються. Для серйозних змін, будь ласка, спочатку відкрийте питання, щоб обговорити, що ви хочете змінити.

## Ліцензія
[MIT](https://choosealicense.com/licenses/mit/)
