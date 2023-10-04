
FROM ababcock01/catalyst-5.9:latest

WORKDIR /app

COPY . /app/

EXPOSE 3000

CMD [ "/bin/bash" ]
