from google.cloud import bigquery

def get_latest_hacker_news(n: int = 5):
    client = bigquery.Client()

    query = f"""
        SELECT id, title, author, time, time_ts
        FROM `bigquery-public-data.hacker_news.stories`
        ORDER BY time desc
        LIMIT {n}
    """
    query_job = client.query(query)

    return query_job

def get_sample_commits_by_year(year: int = 2016):
    client = bigquery.Client()

    query = f"""
        SELECT author.name, COUNT(author.name) as total_commits
        FROM `bigquery-public-data.github_repos.sample_commits`
        WHERE author.date BETWEEN '{year}-01-01' and '{year}-12-31'
        GROUP BY author.name
        ORDER BY total_commits DESC
    """
    query_job = client.query(query)

    return query_job

if __name__ == '__main__':
    get_sample_commits_by_year()

