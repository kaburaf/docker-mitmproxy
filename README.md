Запуск Nuxt2/Nuxt3/Gulp приложения с ключом `inspect` из
контейнера с проксированием серверных и клиентских запросов 
через mitmproxy.

Контейнеры используют переменные из `.env` файла:
```bash
APP=/app/path
ROOT=/path/to/docker-compose.yaml
```

Для удобства можно запускать контейнеры с помощью bash-скрипта
```bash
mitmproxy() {
    mitmPath=mitmproxy/path
    browserPID=/tmp/mitmproxy-browser.pid
    sed -i "s|^\(APP=\).*|\1$PWD|" "$mitmPath/.env"
    case $1 in
        'debug')
            google-chrome-stable --proxy-server="localhost:8080" --user-data-dir="/tmp" http://localhost:8081 http://192.168.100.2:3000 2>/dev/null &
            echo $! > $browserPID
            docker compose --file="$mitmPath/docker-compose.yaml" $@
            ;;
        'up')
            docker compose --file="$mitmPath/docker-compose.yaml" $@
            ;;
        'down')
            if [ -f $browserPID ]; then
                kill -9 $(cat $browserPID)
                rm $browserPID
            fi
            docker compose --file="$mitmPath/docker-compose.yaml" $@
            ;;
        *)
            ;;
    esac
}
```

## HTTPS
Для использования HTTPS необходим сертификат mitmproxy-ca.pem,
который находится тут http://mitm.it/. Его необходимо скачать и 
сохранить в папке `certs`.

## Map Local
https://docs.mitmproxy.org/stable/overview-features/#map-local
Локальный путь должен начинаться с `~/frontend/<app>`
