FROM python:2

ADD . /bom_portal
WORKDIR /bom_portal

COPY requirements.tx ./
RUN pip install --no-cache-dir -r requirements.tx

COPY . .

CMD [ "python", "./run.py" ]
