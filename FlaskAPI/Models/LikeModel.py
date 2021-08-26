from datetime import datetime

class Like():
    def __init__(self) -> None:
        self.activityID = 1
        self.userID = 516875454
        self.likeTime = datetime(2022,4,20,15,30,45)

    def addLike(self):
        pass

    def deleteLike(self):
        pass

    def setActivityID(self,ActivityID):
        self.activityID = ActivityID
        return True

    def getActivityID(self):
        return self.activityID

    def setUserID(self,userID):
        self.userID = userID
        return True

    def getUserID(self):
        return self.userID

    def setLikeTime(self,LikeTime):
        self.likeTime = LikeTime
        return True

    def getLikeTime(self):
        return self.likeTime