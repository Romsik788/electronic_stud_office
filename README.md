# Electronic Student Office

Electornical system to asses srudents

## Installation

You have to Install Python 3.9 or higher.This system uses addons those like Django, PyMySQL and Bcrypt, and because of that you have to have them pre-installed. 

```bash
pip install django pymysql bcrypt
```
Now you have to Install the system it self, if you have git then you can do that with usage of command
```bash
git clone https://github.com/Romsik788/electronic_stud_office
```
Or with usage of an archive stored via link [link](https://github.com/Romsik788/electronic_stud_office/archive/refs/heads/main.zip) which you have to unpackage later
## Usage

Before you laych Django server, you have to do next:

1. Import database file І **electronic_student_office.sql** onto MySQL server. Preferably MySQL 8.0 or higher. As a server you may use [OpenServer](https://ospanel.io/).
2. Create superuser Django, which is able to control whole system and change data in database via admin-panel. To create you have to open project folder(folder has to contain next **manage.py**) and do next command and complete the following. 
```bash
python manage.py createsuperuser
```
3. Now you have to create path between Django and you DataBase. To do that you have to open next file [settings.py](elecoffice/settings.py) and find the following code.
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
These fields are used to gain an access to DataBase, and they have to be changed according to your settings.

**NAME** - DataBase name. Default when you import that *electronic_stud_office*

**USER** and **PASSWORD** - User name and password. Here you have to mention your name and password ,which is going to gain an access to your DataBase onto your MySQL server  *electronic_stud_office*

**HOST** and **PORT** - Adress and port of your MySQL server.

Now you can Launch Django server
```bash
python manage.py runserver
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
## License
[MIT](https://choosealicense.com/licenses/mit/)
