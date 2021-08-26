import dao

class Tag():
    def __init__(self) -> None:
        self.tagID = 0
        self.tagName = 'Normal'
        self.activityID =  1

    def TagInitByID(self,tagID):
        temp = dao.queryByKey('Tags','tagID',tagID)
        self.TagInit(temp[0],temp[1],temp[2])

    def TagInit(self,tagID,tagName,activityID):
        self.tagID = tagID
        self.tagName = tagName
        self.activityID =  activityID

    def addTag(self):
        dao.InsertTag(self.tagID,self.tagName,self.activityID)
        return True

    def deleteTag(self):
        dao.Delete('Tags','tagID',self.tagID)
        return True

    def setTagID(self,TagID):
        self.tagID = TagID
        return True

    def getTagID(self):
        return self.tagID

    def setTagName(self,TagName):
        self.tagName = TagName
        dao.Update('Tags','tagID',self.tagID,'tagName','\''+self.tagName+'\'')
        return True

    def getTagName(self):
        return self.tagName

    def setActivityID(self,ActivityID):
        self.activityID = ActivityID
        dao.Update('Tags','tagID',self.tagID,'activityID',self.activityID)
        return True

    def getActivityID(self):
        return self.activityID

if __name__ == "__main__":
    tag = Tag()
    tag.TagInitByID(1)
    print(tag.tagName)