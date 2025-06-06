from flask import Flask, jsonify
app = Flask(__name__)
@app.route('/api/user-logs')
def user_logs(): return jsonify([])
@app.route('/api/reward-history')
def reward_history(): return jsonify([])
@app.route('/api/settings')
def settings(): return jsonify({})
if __name__ == '__main__': app.run(debug=True)