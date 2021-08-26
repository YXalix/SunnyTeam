from datetime import datetime
import dao


class User():
    def __init__(self):
        self.userID = 0
        self.userPassword = 123456
        self.registerTime = datetime(2000,4,20,15,30,45)
        self.userType = 1