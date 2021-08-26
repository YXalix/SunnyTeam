from datetime import datetime
import dao


class Comment():
    def __init__(self) -> None:
        self.commentID = 1
        self.userID = 516875454
        self.activityID = 1
        self.publishTime = datetime(2022,4,20,15,30,45)
        self.content = 'Love is a gift'
        self.stateType = 0

    def CommentInitByID(self,commentID):
        temp = dao.queryByKey('Comments','commentID',commentID)
        self.CommentInit(temp[0],temp[1],temp[2],temp[3],temp[4],temp[5])

    def CommentInit(self,commentID,userID,activityID,publishTime,content,stateType):
        self.commentID = commentID
        self.userID = userID
        self.activityID = activityID
        self.publishTime = publishTime
        self.content = content
        self.stateType = stateType

    def addComment(self):
        dao.InsertComment(self.commentID,self.userID,self.activityID,self.publishTime,self.content,self.stateType)
        return True

    def deleteCommentID(self):
        dao.Delete('Comments','commentID',self.commentID)
        return True

    def setCommentID(self,CommentID):
        self.commentID = CommentID
        return True

    def getCommentID(self):
        return self.commentID

    def setUserID(self,userID):
        self.userID = userID
        dao.Update('Comments','CommentID',self.commentID,'userID',self.userID)
        return True

    def getUserID(self):
        return self.userID

    def setActivityID(self,ActivityID):
        self.activityID = ActivityID
        dao.Update('Comments','CommentID',self.commentID,'activityID',self.activityID)
        return True

    def getActivityID(self):
        return self.activityID

    def setPublishTime(self,publishTime):
        self.publishTime = publishTime
        dao.Update('Comments','CommentID',self.commentID,'publishTime','\''+self.publishTime+'\'')
        return True

    def getPublichTime(self):
        return self.publishTime

    def setContent(self,content):
        self.content = content
        dao.Update('Comments','CommentID',self.commentID,'content','\''+self.content+'\'')
        return True

    def getContent(self):
        return self.content

    def setStateType(self,StateType):
        self.stateType = StateType
        dao.Update('Comments','CommentID',self.commentID,'stateType',self.stateType)
        return True

    def getStateType(self):
        return self.stateType

if __name__ == "__main__":
    comment = Comment()
    comment.CommentInitByID(1)
    print(comment.content)