from datetime import datetime
import dao

class Attend():
    def __init__(self) -> None:
        self.userID = 516875454
        self.activityID = 1
        self.attendTime = datetime(2022,4,20,15,30,45)
        self.attendReason = "I Like it !"
        self.stateType = 0

    def AttendInitByID(self,userID,activityID):
        temp = dao.queryBy2Key('Attends','userID',userID,'activityID',activityID)
        self.AttendInit(temp[0],temp[1],temp[2],temp[3],temp[4])

    def AttendInit(self,userID,activityID,attendTime,attendReason,stateType):
        self.userID = userID
        self.activityID = activityID
        self.attendTime = attendTime
        self.attendReason = attendReason
        self.stateType = stateType

    def addAttend(self):
        dao.InsertAttend(self.userID,self.activityID,self.attendTime,self.attendReason,self.stateType)
        return True

    def deleteAttend(self):
        dao.Delete('Attends','userID',self.userID,'activityID',self.activityID)
        return True

    def setUserID(self,userID):
        self.userID = userID
        return True

    def getUserID(self):
        return self.userID

    def setActivityID(self,ActivityID):
        self.activityID = ActivityID
        return True

    def getActivityID(self):
        return self.activityID

    def setAttendTime(self,AttendTime):
        self.attendTime = AttendTime
        dao.Update2Key('Attends','userID',self.userID,'activityID',self.activityID,'attendTime','\''+self.attendTime+'\'')
        return True

    def getAttendTime(self):
        return self.attendTime

    def setAttendState(self,AttendState):
        self.stateType = AttendState
        dao.Update2Key('Attends','userID',self.userID,'activityID',self.activityID,'stateType',self.stateType)
        return True

    def getAttendState(self):
        return self.stateType

    def setAttendReason(self,AttendReason):
        self.attendReason = AttendReason
        dao.Update2Key('Attends','userID',self.userID,'activityID',self.activityID,'attendReason','\''+self.attendReason+'\'')
        return True

    def getAttendReason(self):
        return self.attendReason

if __name__ == "__main__":
    attend = Attend()
    attend.AttendInitByID(516875454,1)
    print(attend.attendReason)
    attend.setAttendReason('I like Gauss very much too !')