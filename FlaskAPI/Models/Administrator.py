from UserModel import User
import dao

class Administrator(User):
    def __init__(self):
        super().__init__()
        self.userType = 0

    def AdminInitByID(self,userID):
        temp = dao.queryByKey('Administrators','userID',userID)
        self.AdminInit(temp[0],temp[1],temp[2],temp[3])

    def AdminInit(self,userID,userPassword,registerTime,userType=0):
        self.userID = userID
        self.userPassword = userPassword
        self.registerTime = registerTime
        self.userType = userType

    def addUser(self):
        dao.InsertAdministrator(self.userID,self.userPassword,self.registerTime,self.userType)

    def deleteUser(self):
        dao.Delete('Administrators','userID',self.userID)
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
        dao.Update('Administrators','userID',self.userID,'userPassword','\''+self.userPassword+'\'')
        return True
        
    def getRegisterTime(self):
        return self.registerTime

    def setRegisterTime(self,RegisterTime):
        self.registerTime = RegisterTime
        dao.Update('Administrators','userID',self.userID,'registerTime','\''+self.registerTime+'\'')
        return True

    def getUserType(self):
        return self.userType

    def setUserType(self,UserType):
        self.userType
        dao.Update('Administrators','userID',self.userID,'userType',self.userType)
        return True


if __name__ == "__main__":
    admin = Administrator()
    admin.AdminInitByID(8008)
    print(admin.userPassword)
    admin.setUserID(8000)
    admin.addUser()