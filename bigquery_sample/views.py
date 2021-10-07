from django.http import HttpResponse
from django.shortcuts import render
from google.cloud import bigquery
from bigquery_api_service import get_latest_hacker_news, get_sample_commits_by_year


def index(request):
    return HttpResponse("Hello, world.")

def hacker_news(request):
    latest_hacker_news_query = get_latest_hacker_news(5)

    context = {
        'latest_hacker_news_query': latest_hacker_news_query
    }
    return render(request, 'bigquery_sample\latest_hacker_news.html', context)

def github(request):
    sample_commits_by_year = get_sample_commits_by_year(2016)

    context = {
        'sample_commits_by_year': sample_commits_by_year
    }
    return render(request, 'bigquery_sample\sample_commits.html', context)
