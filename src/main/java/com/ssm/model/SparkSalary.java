package com.ssm.model;


public class SparkSalary {
    public int salaryID;
    public String salary;
    public int snum;

    public int getSalaryID() {
        return salaryID;
    }

    public void setSalaryID(int salaryID) {
        this.salaryID = salaryID;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public int getSnum() {
        return snum;
    }

    public void setSnume(int snum) {
        this.snum = snum;
    }

    @Override
    public String toString() {
        return "SparkSalary{" +
                "salaryID=" + salaryID +
                ", salary=" + salary +
                ", snum=" + snum +
                '}';
    }
}
