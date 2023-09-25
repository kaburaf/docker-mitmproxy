Для использования HTTPS необходим сертификат mitmproxy-ca.pem, 
который находится тут http://mitm.it/. Скачать можно сначала запустив 
сервис с mitmproxy и открыть ссылку в браузере с настройкой прокси.
Сохранить сертификаты в папке certs.

1. Создать ярлык на директорию с приложением
```shell
ln -snf /full/path/to/app/dir ./app
```
2. Исправить entrypoint docker-compose.yaml если необходимо;

3. Запустить командой
```shell
docker compose up -d
```
