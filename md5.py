
import hashlib
def getmd5(filename):
    file_name = filename
    md5 = hashlib.md5()
    with open(file_name,mode="rb") as fobj:
        while True:
            data = fobj.read(4096)
            if data:
                md5.update(data)
            else:
                break
    return md5.hexdigest()