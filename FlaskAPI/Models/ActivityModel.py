from datetime import datetime
import dao

class Activity():
    def __init__(self):
        self.activityID = 1314
        self.activityName = 'Romantic'
        self.position = 'NUAA'
        self.deadline = datetime(2022,4,20,15,30,45)
        self.activityTime = datetime(2000,4,20,15,30,45)
        self.userID = 1314520
        self.userName = 'ZHP'
        self.content = 'See You Forever'
        self.stateType = 0

    def ActivityInitByID(self,activityID):
        temp = dao.queryByKey('Activitys','activityID',activityID)
        self.ActivityInit(temp[0],temp[1],temp[2],temp[3],temp[4],temp[5],temp[6],temp[7],temp[8])

    def ActivityInit(self,activityID,activityName,position,deadline,activityTime,userID,content,stateType,userName):
        self.activityID = activityID
        self.activityName = activityName
        self.position = position
        self.deadline = deadline
        self.activityTime = activityTime
        self.userID = userID
        self.content = content
        self.stateType = stateType
        self.userName = userName

    def addActivity(self):
        dao.InsertActivity(self.activityID,self.activityName,self.position,self.deadline,self.activityTime,self.userID,self.content,self.stateType,self.userName)
        return True

    def deleteActivity(self):
        dao.Delete('Activitys','activityID',self.activityID)
        return True

    def setActivityID(self,ActivityID):
        self.activityID = ActivityID
        return True

    def getActivityID(self):
        return self.activityID

    def setActivityName(self,ActivityName):
        self.activityName = ActivityName
        dao.Update('Activitys','activityID',self.activityID,'activityName','\''+self.activityName+'\'')
        return True

    def getActivityName(self):
        return self.activityName

    def setPosition(self,Position):
        self.Position = Position
        dao.Update('Activitys','activityID',self.activityID,'position','\''+self.position+'\'')
        return True

    def getPosition(self):
        return self.Position

    def setDeadline(self,Deadline):
        self.deadline = Deadline
        dao.Update('Activitys','activityID',self.activityID,'deadline','\''+self.deadline+'\'')
        return True
    
    def getDeadline(self):
        return self.deadline

    def setActivityTime(self,ActivityTime):
        self.activityTime = ActivityTime
        dao.Update('Activitys','activityID',self.activityID,'activityTime','\''+self.activityTime+'\'')
        return True

    def getActivityTime(self):
        return self.activityTime

    def setSponsor(self,SponsorID):
        self.userID = SponsorID
        dao.Update('Activitys','activityID',self.activityID,'userID','\''+self.userID+'\'')
        return True

    def getSponsor(self):
        return self.userID

    def setSponsorName(self,SponsorName):
        self.userName = SponsorName
        dao.Update('Activitys','activityID',self.activityID,'userName','\''+self.userName+'\'')
        return True

    def getSponsorName(self):
        return self.userName

    def setContent(self,Content):
        self.content = Content
        dao.Update('Activitys','activityID',self.activityID,'content','\''+self.content+'\'')
        return True

    def getContent(self):
        return self.content

    def setStateType(self,StateType):
        self.stateType = StateType
        dao.Update('Activitys','activityID',self.activityID,'stateType','\''+self.stateType+'\'')
        return True

    def getStateType(self):
        return self.stateType

if __name__ == "__main__":
    activity = Activity()
    activity.ActivityInitByID(1)
    print(activity.position)