class EnrollmentBillsCreate
  attr_reader :enrollment, :total_value, :amount_bills, :due_day, :bill_value

  def initialize(enrollment, enrollment_params)
    @enrollment = enrollment.presence
    @amount_bills = enrollment_params[:amount_bills].to_i
    @total_value = enrollment_params[:total_value].to_f
    @due_day = enrollment_params[:due_day].to_i
  end
    
  def self.perform(*args)
    new(*args).tap(&:perform)
  end

  def perform
    calculate_bill_value
    bills_generate
  end

  private

  def calculate_bill_value
    @bill_value = (total_value/amount_bills).truncate(2)
  end

  def bills_generate
    month = first_month(due_day)
    date = due_date(due_day, month, today.year) 

    amount_bills.times do
      create_bill(due_date(due_day, date.month, date.year))
      date = date.next_month
    end
  end

  def first_month(due_day)
    (today.day >= due_day.to_i) ? today.next_month.month : today.month          
  end

  def today
    Date.today
  end

  def due_date(due_day, month, year)
    begin
      Date.new(year, month, due_day)
    rescue Date::Error => e
      Date.civil(year, month, -1)
    end
  end

  def create_bill(due_date)
    bill = Bill.create({
      bill_value: bill_value,
      due_date: due_date,
      enrollment_id: enrollment.id,
      student_id: enrollment.student.id,
      institution_id: enrollment.institution.id,
      paid_value: nil,
      status: 'open'
    })
    unless bill.save
      render json: { message: "Bill don't save!", data: bill.errors }, status: :unprocessable_entity
    end
  end
end

