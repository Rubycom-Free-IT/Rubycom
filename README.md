# Rubycom

Бесплатный образовательный курс для начинающих по Ruby

### Homework #01 | Ruby Koans

1. Удалить тестовый файл с первым коммитом (my_first_commit.txt) из вашей папки homework01
2. Перейти на сайт http://rubykoans.com/ и скачать архив, в котором лежит набор тестов
3. Извлечь содержимое архива в папку `rubycom/<UserName>/homework01/`
4. Закомментировать файл about_java_interop.rb (вряд ли вы это когда-либо будете использовать :alien: )
5. Решить все тесты и прислать скриншот с результатом запуска
```ruby
ruby `ls about_*`
```

### Homework #02 | Gems

1. Создать директорию `rubycom/<UserName>/homework02/`
2. В созданной директории создать 2 поддиректории: `main` и `converter`
3. В директории `converter` создать гем, который умеет конвертировать 4 валюты (можно больше, но 4 - минимальное требование: USD, EUR, BYN, RUB)
4. Валюты конвертируются по курсам нацбанка, которые предварительно сохраняются в файл (в CSV или JSON формате)
5. Реализовать гем для конвертации валют согласно курсам, подгружаемым из сохранённых файлов
6. Гем `converter` использует внутри себя гем `money`, с помощью которого как минимум выводится результат (например с помощью метода `.format`, рассмотренного на лекции №5: `Money.new(100, 'USD').format`) и информация о конвертируемых валютах. Приветствуется использование других гемов (к примеру: `colorize` - см. инфу в гугле)
7. В директории `main` создается `Gemfile`, с помощью которого в ваш проект подгружается созданный вами гем `converter`
8. В директории `main` создается файл `test.rb`, в котором выводится результат работы следующих тестовых запросов:
```ruby
	converter = Converter.new('1.00', 'USD')
	puts converter.to_eur # => Пример вывода: '$1 = €0.87 (<здесь информация про конвертируемые валюты>)'
	puts converter.to_byn
	puts converter.to_rub

	# Допустимы другие варианты реализации, к примеру:
	puts Converter.convert('1.00', 'USD', 'EUR') # amount, currency_from, currency_to
	# => Пример вывода: '$1 = €0.87 (<здесь информация про конвертируемые валюты>)'
```
9. Предусмотреть и обработать ошибочные ситуации с пустыми параметрами, с нулевыми суммами, с несуществующими валютами и т.д. (к примеру: выводить сообщения об ошибках)
10. Использовать Rubocop для проверки код-стайла (базовую конфигурацию или, к примеру, https://github.com/rubocop-hq/rubocop)
11. Покрыть гем `converter` тестами с помощью `rspec`
12. Покрыть проект `main` тестовыми сценариями с помощью `cucumber`

### Homework #03

pending...

### Team Homework #04

pending...
