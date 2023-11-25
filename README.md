# Mire 

Это насильственная МПД. (Многопользовательское подземелье)

## Usage

Сначала убедитесь, что на вашем компьютере установлена `java`
. [OpenJDK](https://adoptopenjdk.net ) рекомендуется. Это должна
быть как минимум версия 8, но более новые версии (протестированные до 17) тоже должны работать.

Выполните команду "./lein run" внутри каталога Mire, чтобы запустить сервер Mire
. Затем игроки могут подключиться по telnet к порту 3333.

## Motivation

Основная цель этой кодовой базы - демонстрация того, как
создать простой многопоточный сервер в Clojure.

Mire создается шаг за шагом, где каждый шаг вводит один или два
небольших, но ключевых принципа Clojure и основывается на последнем шаге.
Каждый из этих шагов существует в отдельных ветвях git. Чтобы получить максимальную отдачу от
чтения Mire, вам следует начать чтение в ветке под названием
[step-01-echo-server](http://github.com/technomancy/mire/tree/01-echo-server )
и продолжайте оттуда.

Хотя вы можете учиться у Mire сами по себе, она была написана
специально для [скринкаста PluralSight на
Clojure](https://www.pluralsight.com/courses/functional-programming-clojure ).
[Запись в блоге](https://technomancy.us/136 ) пошагово описывает кодовую
базу и показывает, как внести незначительные обновления для более свежей версии Clojure.

Авторское право © 2009-2021 Фил Хагельберг
Лицензируется на тех же условиях, что и Clojure.

# Наши доработки

## Над доработкой проекта работали:

1. Ширко Александр
2. Поздняков Иван
3. Махалин Семён
4. Кузьмин Кирилл

## Как запустить

1. Убедитесь в том, что у вас установлен Linux, либо есть виртуальная машина на ОС Linux
2. Необходимо склонировать данный репозиторий на свой ПК `git clone`
3. Для запуска игры со стороны Clojure, обратите внимание на раздел **Usage**
4. Для запуска бота, необходимо установить приложение SWI-Prolog
5. По кнопке file-Consult... подключиться к файлу Bot.pl
6. в консоли Prolog написать `main.`

## Как играть 

Попадая в игру, вам будет предложено ввести свое имя (вводите, что хотите, главное чтобы это был текст или цифры). Затем вам высветится характеристика вашего персонажа и вы попадете в первую комнату (будьте аккуратны и не пугайтесь XD). В комнате вам будет предложено к выбору несколько направлений, где находится следующая комната. Чтобы пойти куда-либо, необходимо выбрать направление и написать одну из команд в консоли `north`, `west`, `south`, `east`. Также вам будут встречаться предметы, их можно подобрать командой `grab *название предмета*`.

# Геймплей

Добро пожаловать в увлекательный мир подземелья, где приключения и опасности ожидают каждого храброго игрока! Представьте себе эту захватывающую игру, где вам предстоит исследовать лабиринт комнат, расположенных во всех направлениях света.

Ваш герой стоит на пороге внушительных врат, которые ведут в таинственное подземелье. Когда вы переступаете через порог, перед вашими глазами развертывается удивительное зрелище. Комнаты, каждая со своим уникальным дизайном и атмосферой, простираются во все стороны, словно множество загадочных пазлов, ожидающих вашего решения.

Приготовьтесь к сражениям и испытаниям, ведь в этих мрачных закоулках подземелья скрываются зловещие орки! Вооружившись своим мастерством и отвагой, вы вступаете в схватку с этими мерзкими тварями. Каждый бой - настоящая симфония битвы, где ваши навыки и реакция будут испытаны до предела. Хладнокровно уклоняйтесь от ударов орков, искусно нанося свои удары, чтобы одержать победу.

Однако, вы не одиноки в этом мрачном лабиринте. Вам встретится еще один герой, так же смелый и отважный, как и вы. Он исследует подземелье в поисках приключений и славы. Вместе вы сможете объединить свои силы, чтобы справиться с орками и дать им достойный отпор. Каждый ваш шаг и решение становятся важнее, ведь только вместе вы сможете победить!

Представьте себе динамичный геймплей, где каждая комната подземелья ожидает вашего исследования, каждый предмет - возможность усилить своего героя, а каждый бой и встреча - испытание, которое делает вас сильнее. Вас ждет захватывающее путешествие в подземелье, где только самые отважные и находчивые смогут добиться победы и стать легендой!

## Добавленный функционал

В процессе доработки игры в код clojure была добавлена реализация битвы с троллями. При в ходе в комнату игрок встечается с монстром, вне зависимости от того, зачищалась ли эта комната от врагов ранее, то есть в каждой комнате установлен автоспавн. Сама битва реализована следующим образом: подбрасывается кубик и, в зависимости от выпавшего количество очков, рассчитывается урон.
```Clojure
(defn real-damage
  [base sides]
  (let [rd (roll-dice sides)
        s (/ sides 2)]
    (cond
      (<= rd s) (int (/ base 2))
      (> rd s) base
      (= rd sides) (* base 2))))
```

Также был создан бот на языке логического программирования Prolog. Бот имитирует игрока, который движется по кругу и зачищает комнаты от монстров. На уровне кода искусственно создан путь, который будет двигать бота по кругу по всем комнатам. Далее идет обработка потока данных, где считывается направление и происходит работа с сервером. 
