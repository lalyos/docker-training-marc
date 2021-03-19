FROM ubuntu
RUN apt-get update -qq
RUN apt-get install -y curl
RUN apt-get install -y nginx
COPY start.sh /
RUN chmod +x /start.sh
EXPOSE 80
ENV TITLE=Welcome
ENV COLOR=lighgreen
ENV BODY="12factor app"
RUN apt-get install -y mysql-client
CMD [ "/start.sh" ]