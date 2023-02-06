
create table Employee21(
EmpID int primary key not null identity(1,1),
EmpName varchar(100) not null,
EmpAddress varchar(100) not null,
EmpSalary money not null,
DeptId int not null references Dept21(DeptId))

create table Dept21 (
DeptId int primary key not null identity(1,1),
DeptName varchar(50) not null,
Location varchar(50) not null)

select * from Employee21;
select * from Dept21;

INSERT INTO Dept21 Values('Human Resources','Bangalore')
INSERT INTO Employee21 VALUES('Karthik','HUbli',28000,1)D:\murgesh\c#\DotnNet\copmletDotnettraining\End To End Application\EmployeeLibr\EmployeeLibr\DataClasses\



@model List<EmployeeLibr.DataClasses.Employee21>
@{
    var options = new AjaxOptions
    {
        InsertionMode = InsertionMode.Replace,
        UpdateTargetId = "divArea"


    };
}


@using (Html.BeginForm())
{
    <div>
        <table border="1">
            <tr>
                <th>Employee ID</th>
                <th>EMployee Name</th>
                <th>Employee Address</th>
                <th>Employee Salary</th>
                <th>Dept ID</th>
            </tr>
            @foreach (var emp in Model)
            {
                <tr>
                    <td>@emp.EmpID</td>
                    <td>@emp.EmpName</td>
                    <td>@emp.EmpAddress</td>
                    <td>@emp.EmpSalary</td>
                    <td>@emp.DeptId</td>
                    <td>
                        @Ajax.ActionLink("Edit", "Edit", new { id = emp.EmpID }, options, new { @class = "btn btn-info" })
                    </td>
                </tr>
            }
        </table>
    </div>
}

@model List<EmployeeLibr.DataClasses.Employee21>
@{
    ViewBag.Title = "Index";
}

<h2>Index</h2>
<div class="container">
    <div class="DivArea">
        Hi
    </div>
D:\murgesh\c#\DotnNet\copmletDotnettraining\End To End Application\EmployeeLibr\EmployeeLibr\DataClasses\model.edmx
</div>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeLibr.DataClasses
{
    interface IDataClass
    {
        void AddNewEmployee(Employee21 emp);
        void UpdateEmployee(Employee21 emp);
        void DeleteEmployee(int id);
        List<Employee21> GetAllEmployees();
        List<Dept21> GetAllDepts();
    }
    public class EmployeeDataComponentP : IDataClass
    {
        private readonly EmployeDbEntities _context = new EmployeDbEntities();
        public void AddNewEmployee(Employee21 emp)
        {
            _context.Employee21.Add(emp);
            _context.SaveChanges();
        }

        public void DeleteEmployee(int id)
        {
            throw new NotImplementedException();
        }

        public List<Dept21> GetAllDepts()
        {
            throw new NotImplementedException();
        }

        public List<Employee21> GetAllEmployees()
        {
            return _context.Employee21.ToList();
        }

        public void UpdateEmployee(Employee21 emp)
        {
            var content = _context.Employee21.FirstOrDefault((e) => e.EmpID == emp.EmpID);
            if(content!= null)
            {
                content.EmpAddress = emp.EmpAddress;
                content.EmpName = emp.EmpName;
                content.EmpSalary = emp.EmpSalary;
                content.DeptId = content.DeptId;
            }
            else
            {
                throw new Exception("No record found");
            }
        }
    }

}
