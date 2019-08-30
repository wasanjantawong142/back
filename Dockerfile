FROM django

ADD . /bom_portal

WORKDIR /bom_portal

RUN pip install -r requirements.txt

CMD [ "python", "./run.py runserver 0.0.0.0:9000" ]