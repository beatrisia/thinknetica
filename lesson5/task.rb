=begin
    Создать модуль, который позволит указывать название компании-производителя и получать его. Подключить модуль к классам Вагон и Поезд
    В классе Station (жд станция) создать метод класса all, который возвращает все станции (объекты), созданные на данный момент
    Добавить к поезду атрибут Номер (произвольная строка), если его еще нет, который указыватеся при его создании
    В классе Train создать метод класса find, который принимает номер поезда (указанный при его создании)
    и возвращает объект поезда по номеру или nil, если поезд с таким номером не найден.


    Создать модуль InstanceCounter, содержащий следующие методы класса и инстанс-методы, которые подключаются
    автоматически при вызове include в классе:
    Методы класса:
           - instances, который возвращает кол-во экземпляров данного класса
    Инастанс-методы:
           - register_instance, который увеличивает счетчик кол-ва экземпляров класса и который можно
             вызвать из конструктора. При этом данный метод не должен быть публичным.
    Подключить этот модуль в классы поезда, маршрута и станции.

=end



  def set_manufacturer(manufacturer)
    @manufacturer = manufacturer
  end
