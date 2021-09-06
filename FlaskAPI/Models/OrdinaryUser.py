from logging import NullHandler

from pymysql import NULL
from Models.UserModel import User
import Models.dao as dao

class OrdinaryUser(User):
    def __init__(self):
        super().__init__()
        self.userType = 0
        self.userName = 'Someone'
        self.School = 'ZJU'

    def generate_token(userid):
        return userid

    def userCheckByID(userID):
        temp = dao.queryByKey('OrdinaryUsers','userID',userID)
        if temp == None:
            return False
        else:
            return True

    def OrdinaryInitByID(self,userID):
        temp = dao.queryByKey('OrdinaryUsers','userID',userID)
        if temp != None:
            self.OrdinaryInit(temp[0],temp[1],temp[2],temp[3],temp[4],temp[5])

    def OrdinaryInit(self,userID,userPassword,registerTime,userType,userName,School):
        self.userID = userID
        self.userPassword = userPassword
        self.registerTime = registerTime
        self.userType = userType
        self.userName = userName
        self.School = School

    def addUser(self):
        dao.InsertOrdinaryUser(self.userID,self.userPassword,self.registerTime,self.userType,self.userName,self.School)
        return True

    def deleteUser(self):
        dao.Delete('OrdinaryUsers','userID',self.userID)
        return True

    def getUserName(self):
        return self.userName

    def setUserName(self,userName):
        self.userName = userName
        dao.Update('OrdinaryUsers','userID',self.userID,'userName','\''+self.userName+'\'')
        return True

    def getUserSchool(self):
        return self.School

    def setUserSchool(self,School):
        self.School = School
        dao.Update('OrdinaryUsers','userID',self.userID,'School','\''+self.School+'\'')
        return True

    def getUserID(self):
        return self.userID

    def setUserID(self,userID): #no use
        self.userID = userID
        return True
    
    def getUserPassword(self):
        return self.userPassword

    def setUserPassword(self,Password):
        self.userPassword = Password
        dao.Update('OrdinaryUsers','userID',self.userID,'userPassword','\''+self.userPassword+'\'')
        return True
        
    def getRegisterTime(self):
        return self.registerTime

    def setRegisterTime(self,RegisterTime):
        self.registerTime = RegisterTime
        dao.Update('OrdinaryUsers','userID',self.userID,'registerTime','\''+self.registerTime+'\'')
        return True

    def getUserType(self):
        return self.userType

    def setUserType(self,UserType):
        self.userType
        dao.Update('OrdinaryUsers','userID',self.userID,'userType',self.userType)
        return True
        
if __name__ == "__main__":
    user = OrdinaryUser()
    user.OrdinaryInitByID(5168754)
    print(user.userName)