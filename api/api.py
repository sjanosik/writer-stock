import os
import sqlite3

from flask import Flask, request

app = Flask(__name__)


@app.route('/pieces/getShuffleOptions')
def get_shuffle_options():
    params = request.args
    include_base = params.get("includeBase", True)
    include_user = params.get("includeUser", True)
    user = params.get("userId")

    db = sqlite3.connect(os.getenv('WRITERSTOCK_DATABASE_URI'))
    rows = []
    if include_base:
        for row in db.execute('select name, description from category'):
            rows.append({'name': row[0], 'description': row[1]})
    if include_user and user:
        for row in db.execute(f'select distinct category_id from piece where user_id = {user}'):
            rows.append({'name': row[0], 'description': None})

    print(f'Got categories: {rows}')

    return {'categories': rows}
