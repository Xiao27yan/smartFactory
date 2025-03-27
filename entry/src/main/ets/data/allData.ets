import { User } from '../model/User'
AppStorage.setOrCreate("allUserListData",[
  new User('姓名','状态','部门'),
  new User('Alice', 'Active', 'Engineering'),
  new User('Bob', 'Inactive', 'Marketing'),
  new User('Charlie', 'Active', 'Sales')
])