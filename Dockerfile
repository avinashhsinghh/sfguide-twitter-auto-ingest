FROM python:slim
RUN pip install -U pip
RUN pip install --no-cache-dir boto3
RUN pip install --no-cache-dir awscli
RUN pip install --no-cache-dir tweepy
RUN pip install --no-cache-dir datetime


    #get your AWS Access keys: https://docs.aws.amazon.com/powershell/latest/userguide/pstools-appendix-sign-up.html
ENV AWS_Access_Key_ID="AKIA4SWWDZN6XC4YFCGF"\
    AWS_Secret_Access_Key="JQ6ma9uKkye3Vjare9dG4miWBiGFnZ5HaXpw84eJ"\
    # Default AWS Region
    AWS_DEFAULT_REGION="us-east-1"\
    #get your Twitter API Key and Secret https://developer.twitter.com/en/apply-for-access
    consumer_key="p210fxKOXExyCWO6XNz5HS1BH"\
    consumer_secret="Zdn5a2q5CODWr2zwXIjBNvXx30dEee5LJT7Xjco0df4qR5RAoi"\
    # get your Twitter Access Token and Secret https://developer.twitter.com/en/apply-for-access
    access_token="3224450994-eFTQs6bGZAfjOjoE1gVSTwfg4zTxhas1DtF2bWd"\
    access_token_secret="ZK8AuX6vz7lSvp8rAHJ4t3UiohwDEg0o1NZMllI0Bm8s6"\
    # Bearer Token
    #bearer_token="AAAAAAAAAAAAAAAAAAAAAC8lPgEAAAAAeiedbNhj795AsuT9Gv0pwPBfYGk%3D3HmZ9DJtBckWjQyFTgY2XmVRAvHItGr7oR8QPfgOEnDN5kOB4L"\
    #AWS bucket name
    bucket="my-twitter-bucket-misohe"\
    # specify your own default twitter keyword here. 
    keyword="covid19"

ENV PYTHONUNBUFFERED=1

COPY ./twitter_local.py .
COPY ./twitter_local.sh .

RUN aws configure set aws_access_key_id $AWS_Access_Key_ID
RUN aws configure set aws_secret_access_key $AWS_Secret_Access_Key
RUN aws configure set aws_default_region $AWS_DEFAULT_REGION
RUN ["chmod","+x","/twitter_local.sh"]
ENTRYPOINT ["/bin/sh","/twitter_local.sh"]
