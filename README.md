Здрайствуйте
Сразу хочется сказать, что я сглупил

Во-1: У меня было сделано записывание токена, однако я, когда отрпавил убрал его

Во-2: У меня был скрин для добавления чата и по спешке, когда менял стили, забыл прикуртить floatinActionButton

А так я использовал flutter_bloc, поскольку это самый лучший statet manager(имхо)

-Написал :
  AuthBloc для работы с авторизацией
  
  TopicBloc для работы с чатом(вначале показать все чаты, чтобы при нажатии мы переходили в чат. При нажатии на кнопку назад выход на экран с чатами.
    Создание чата было реазовано, однако я забыл прикрутить кнопку, сразу после создания нас закидывает в тот чат)
    
   MyGeolocationBloc для определения нашего местоположения
   GeolocationBloc дял работы с картами
   
   MessageBloc для отправки сообщений(хетолось все перекинуть на блоки, чтобы разделить ui от бизнес логики, однако не успел(()
   
Я из-за времени не писал хендлинг ошибок

Забыл покызать snackbar при ошибкки авторизации

Использовал flutter_secure_token_storage для хранения токена + username(Соглашусь решение не очень, но мне остовалось пару минут до конца и времени подключить hive не остовалось). В 1 дне у меня сделано логика нормально, то есть при запуске проверяется наличие токена => если есть, то экран с чатом, иначе экран с авторизацией

https://drive.google.com/file/d/1cGNNjTuI98QdNZRNdOJ6wSHqvXU_LDtB/view?usp=drivesdk Вот видео с 1 дня. Если посмотреть, то я запускаю приложение, а он сразу закидывает меня на экран чатов

Использовал flutter_map для добавдения геоданных и просмотра

Использовал гелокатор, чтобы определить местоположение человека, однако не успел написать в Lister-е, чтобы передвинул к нашему местоположению(

Резимируя, накасячил во многих аспектах, из-за волнения(впервые учавтсовал в таких мероприятиях). Хочется попасть к вам на стажировку

Я вам писал уже давно, однако я написал после 1-го джема, поэтому не смог попасть

Спасибо вам за проведение такого мероприятия, узнал что я ещё слаб)

Апишка просто бомба честно говоря)

Сначала было страшно(изначально считал, что задача прям сложно, но потом оказалось все намного проще)

Надеюсь попасть к вам, чтобы подтянуть все свои недостатки + хочется стать ещё лучше

Насчет 1-го дня там дизайн ужасный)

Хотелось ещё сделать так, чтобы на сообщения можно было отвечать, но время

И я решил просто здесь все рассписать(Постарался)

Видео как выглядит(+ добавил кнопку с созданием чата)
https://drive.google.com/file/d/1c1A3LZNvULOv7jwWlhBsZ6Pih97TMnOc/view?usp=drivesdk
