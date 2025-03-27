export class User{
  private _name: string

  public set name(value: string) {
    this._name = value
  }

  public get name(): string {
    return this._name
  }

  private _status: string

  public set status(value: string) {
    this._status = value
  }

  public get status(): string {
    return this._status
  }

  private _department: string

  public set department(value: string) {
    this._department = value
  }

  public get department(): string {
    return this._department
  }

  constructor(name: string, status: string, department: string) {
    this._name = name
    this._status = status
    this._department = department
  }

}