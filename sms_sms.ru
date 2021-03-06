#!/bin/bash

# Send sms by sms.ru

# Get directory where this script is                                                                               
# https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Import config
source "$DIR/config"

API_ID="${SMSRU_API_ID}"
#FROM="${PHONE_FROM}"

TO=$1
SUBJECT="$2"
#BODY="$3"

RES=($(curl -s -S -d "msg=$SUBJECT" http://sms.ru/sms/send\?api_id=${API_ID}\&to=${TO}))

RETCODE=${RES[0]}
MSGID=${RES[1]}
BALANCE=${RES[2]}

if [ "$RETCODE" == "100" ]
then
    echo "Message \"$SUBJECT\" was sent with id:$MSGID, $BALANCE"
else
    echo "Error sending message, code:$RETCODE"
fi


#-1  Сообщение не найдено
#100     Запрос выполнен или сообщение находится в нашей очереди
#101     Сообщение передается оператору
#102     Сообщение отправлено (в пути)
#103     Сообщение доставлено
#104     Не может быть доставлено: время жизни истекло
#105     Не может быть доставлено: удалено оператором
#106     Не может быть доставлено: сбой в телефоне
#107     Не может быть доставлено: неизвестная причина
#108     Не может быть доставлено: отклонено
#110     Сообщение прочитано
#150     Не может быть доставлено: не найден маршрут на данный номер
#200     Неправильный api_id
#201     Не хватает средств на лицевом счету
#202     Неправильно указан номер телефона получателя, либо на него нет маршрута
#203     Нет текста сообщения
#204     Имя отправителя не согласовано с администрацией
#205     Сообщение слишком длинное (превышает 8 СМС)
#206     Будет превышен или уже превышен дневной лимит на отправку сообщений
#207     На этот номер нет маршрута для доставки сообщений
#208     Параметр time указан неправильно
#209     Вы добавили этот номер (или один из номеров) в стоп-лист
#210     Используется GET, где необходимо использовать POST
#211     Метод не найден
#212     Текст сообщения необходимо передать в кодировке UTF-8 (вы передали в другой кодировке)
#213     Указано более 100 номеров в списке получателей
#220     Сервис временно недоступен, попробуйте чуть позже
#230     Превышен общий лимит количества сообщений на этот номер в день
#231     Превышен лимит одинаковых сообщений на этот номер в минуту
#232     Превышен лимит одинаковых сообщений на этот номер в день
#233     Превышен лимит отправки повторных сообщений с кодом на этот номер за короткий промежуток времени ("защита от мошенников", можно отключить в разделе "Настройки")
#300     Неправильный token (возможно истек срок действия, либо ваш IP изменился)
#301     Неправильный api_id, либо логин/пароль
#302     Пользователь авторизован, но аккаунт не подтвержден (пользователь не ввел код, присланный в регистрационной смс)
#303     Код подтверждения неверен
#304     Отправлено слишком много кодов подтверждения. Пожалуйста, повторите запрос позднее
#305     Слишком много неверных вводов кода, повторите попытку позднее
#500     Ошибка на сервере. Повторите запрос.
#901     Callback: URL неверный (не начинается на http://)
#902     Callback: Обработчик не найден (возможно был удален ранее)
