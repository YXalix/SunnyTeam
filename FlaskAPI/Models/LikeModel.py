from datetime import datetime
import dao

class Like():
    def __init__(self) -> None:
        self.activityID = 1
        self.userID = 516875454
        self.likeTime = datetime(2022,4,20,15,30,45)

    def LikeInitByID(self,activityID,userID):
        temp = dao.queryBy2Key('Likes','activityID',activityID,'userID',userID)
        self.LikeInit(temp[0],temp[1],temp[2])

    def LikeInit(self,activityID,userID,likeTime):
        self.activityID = activityID
        self.userID = activityID
        self.likeTime = likeTime

    def addLike(self):
        dao.InsertLike(self.activityID,self.userID,self.likeTime)
        return True

    def deleteLike(self):
        dao.Delete2Key('Likes','activityID',self.activityID,'userID',self.userID)
        return True

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
        dao.Update2Key('Likes','activityID',self.activityID,'userID',self.userID,'likeTime','\''+self.likeTime+'\'')
        return True

    def getLikeTime(self):
        return self.likeTime

if __name__ == "__main__":
    like = Like()
    like.LikeInitByID(1,516875454)
    print(like.likeTime)