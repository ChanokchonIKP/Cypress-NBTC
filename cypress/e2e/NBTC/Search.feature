Feature: NBTC
  Scenario: Search for a keyword All
    Given Go to NTBC homepage
    When Click left bar "ระบบจัดการของกลาง" page
    And input type "ไมโครโฟนไร้สาย"
    And input brand "SONY"
    And input model "UWP-D"
    And input startdate "22/01/2563"
    And input enddate "22/01/2563"
    And Click button "ค้นหา"
    Then check results within the date range
    Then Show result "ทำการเรียกข้อมูลสำเร็จ"
    When click detail "1"
    Then check detail type
    Then check detail brand
    Then check detail model
  
  Scenario: Search for a keyword Type
    Given Go to NTBC homepage
    When Click left bar "ระบบจัดการของกลาง" page
    And input type "วิทยุสื่อสาร"
    And Click button "ค้นหา"
    Then Show result "ทำการเรียกข้อมูลสำเร็จ"
    When click detail "1"
    Then check detail type

  Scenario: Search for a keyword Brand
    Given Go to NTBC homepage
    When Click left bar "ระบบจัดการของกลาง" page
    And input brand "BAOFENG"
    And Click button "ค้นหา"
    Then Show result "ทำการเรียกข้อมูลสำเร็จ"
    When click detail "1"
    Then check detail brand

  Scenario: Search for a keyword Model
    Given Go to NTBC homepage
    When Click left bar "ระบบจัดการของกลาง" page
    And input model "UV5R"
    And Click button "ค้นหา"
    Then Show result "ทำการเรียกข้อมูลสำเร็จ"
    When click detail "1"
    Then check detail model

  Scenario: Search for a Full Date
    Given Go to NTBC homepage
    When Click left bar "ระบบจัดการของกลาง" page
    And input startdate "27/02/2566"
    And input enddate "27/02/2566"
    And Click button "ค้นหา"
    Then Show result "ทำการเรียกข้อมูลสำเร็จ"
    Then check results within the date range

  Scenario: Search for a Startdate
    Given Go to NTBC homepage
    When Click left bar "ระบบจัดการของกลาง" page
    And input startdate "27/02/2566"
    And Click button "ค้นหา"
    Then Show result "ทำการเรียกข้อมูลสำเร็จ"
    Then Check date to be more or equal than startdate

  Scenario: Search for a Enddate
    Given Go to NTBC homepage
    When Click left bar "ระบบจัดการของกลาง" page
    And input enddate "27/02/2566"
    And Click button "ค้นหา"
    Then Show result "ทำการเรียกข้อมูลสำเร็จ"
    Then Check date to be less or equal than enddate

  Scenario: Search for a Full Date Wrong
    Given Go to NTBC homepage
    When Click left bar "ระบบจัดการของกลาง" page
    And input startdate "27/"
    And input enddate "27/"
    And Click button "ค้นหา"
    Then Show result "กรุณาระบุวันที่ให้ถูกต้อง"

  Scenario: Search for a Startdate Wrong
    Given Go to NTBC homepage
    When Click left bar "ระบบจัดการของกลาง" page
    And input startdate "27"
    And Click button "ค้นหา"
    Then Show result "กรุณาระบุวันที่ให้ถูกต้อง"

  Scenario: Search for a Enddate Wrong
    Given Go to NTBC homepage
    When Click left bar "ระบบจัดการของกลาง" page
    And input startdate "27"
    And Click button "ค้นหา"
    Then Show result "กรุณาระบุวันที่ให้ถูกต้อง"

  Scenario: Search for a keyword All no result
    Given Go to NTBC homepage
    When Click left bar "ระบบจัดการของกลาง" page
    And input type "วิทยุสื่อสาร"
    And input brand "B"
    And input model "U"
    And input startdate "27/02/2566"
    And input enddate "27/02/2566"
    And Click button "ค้นหา"
    Then Show result "ไม่พบรายการของกลางที่ค้นหา"

  Scenario: Create case All
    Given Go to NTBC homepage
    When Click left bar "ระบบจัดการของกลาง" page
    And Click button "เพิ่มรายการ"
    And input record "วิทยุสื่อสาร"
    And input case date "17/02/2566"
    And input accuser "ผู้กล่าวหา"
    And input suspect "ผู้ต้องหา"
    And input offence "ความผิด"
    And input mulct "100000"
    And input storage "P"
    And input note "เพิ่มเติม"
    And Click button "เพิ่มของกลาง"
    And input type item "ไมโครโฟนไร้สาย"
    And input brand item "sanyo"
    And input model item "sr-012"
    And input detail item "สีดำ"
    And input amount item "20"
    And input price item "2500"
    And input date item "07/03/2566"
    And input note item "ทดสอบ"
    And save item
    Then check detail item all row "1"
    # Then check type item row "1"
    # And check brand item row "1"
    # And check model item row "1"
    # And check detail item row "1"
    # And check amount item row "1"
    # And check price item row "1"
    # And check date item row "1"
    # And check note item row "1"
    And status pass item row "1"
    When Click button "ดำเนินการ"
    And Click button "ยืนยัน"
    Then check detail case all
    And check detail item all row "1"


  Scenario: Create case Madatory
    Given Go to NTBC homepage
    When Click left bar "ระบบจัดการของกลาง" page
    And Click button "เพิ่มรายการ"
    And input record "จำหน่าย"
    And input case date "19/03/2566"
    And input accuser "ผู้กล่าวหา"
    And input suspect "ผู้ต้องหา"
    And input offence "ความผิด"
    And Click button "เพิ่มของกลาง"
    And input type item "สายอากาศ"
    And input amount item "10"
    And input price item "500"
    And input date item "19/03/2566"
    And save item
    Then check detail item mandatory row "1"
    And status pass item row "1"
    When Click button "ดำเนินการ"
    And Click button "ยืนยัน"
    Then check detail case mandatory
    And check detail item mandatory row "1"

  Scenario: Create case fail 1
    Given Go to NTBC homepage
    When Click left bar "ระบบจัดการของกลาง" page
    And Click button "เพิ่มรายการ"
    # And input record "จำหน่าย"
    And input accuser "ผู้กล่าวหา"
    And input case date "08/03/2566"
    And input suspect "ผู้ต้องหา"
    And input offence "ความผิด"
    And Click button "เพิ่มของกลาง"
    And input type item "สายอากาศ"
    And input amount item "10"
    And input price item "500"
    And input date item "19/03/2566"
    And save item
    Then status pass item row "1"
    When Click button "ดำเนินการ"
    Then Show result "กรุณากรอกข้อมูลคดีให้ครบถ้วน"

  Scenario: Create case fail 2
    Given Go to NTBC homepage
    When Click left bar "ระบบจัดการของกลาง" page
    And Click button "เพิ่มรายการ"
    And input record "จำหน่าย"
    And clear case date
    And input accuser "ผู้กล่าวหา"
    And input suspect "ผู้ต้องหา"
    And input offence "ความผิด"
    And Click button "เพิ่มของกลาง"
    And input type item "สายอากาศ"
    And input amount item "10"
    And input price item "500"
    And input date item "19/03/2566"
    And save item
    Then status pass item row "1"
    When Click button "ดำเนินการ"
    Then Show result "กรุณากรอกข้อมูลคดีให้ครบถ้วน"

  Scenario: Create case fail 3
    Given Go to NTBC homepage
    When Click left bar "ระบบจัดการของกลาง" page
    And Click button "เพิ่มรายการ"
    And input record "จำหน่าย"
    And input case date "19/03/2566"
    # And input accuser "ผู้กล่าวหา"
    And input suspect "ผู้ต้องหา"
    And input offence "ความผิด"
    And Click button "เพิ่มของกลาง"
    And input type item "สายอากาศ"
    And input amount item "10"
    And input price item "500"
    And input date item "19/03/2566"
    And save item
    Then status pass item row "1"
    When Click button "ดำเนินการ"
    Then Show result "กรุณากรอกข้อมูลคดีให้ครบถ้วน"

  Scenario: Create case fail 4
    Given Go to NTBC homepage
    When Click left bar "ระบบจัดการของกลาง" page
    And Click button "เพิ่มรายการ"
    And input record "จำหน่าย"
    And input case date "19/03/2566"
    And input accuser "ผู้กล่าวหา"
    # And input suspect "ผู้ต้องหา"
    And input offence "ความผิด"
    And Click button "เพิ่มของกลาง"
    And input type item "สายอากาศ"
    And input amount item "10"
    And input price item "500"
    And input date item "19/03/2566"
    And save item
    Then status pass item row "1"
    When Click button "ดำเนินการ"
    Then Show result "กรุณากรอกข้อมูลคดีให้ครบถ้วน"

  Scenario: Create case fail 5
    Given Go to NTBC homepage
    When Click left bar "ระบบจัดการของกลาง" page
    And Click button "เพิ่มรายการ"
    And input record "จำหน่าย"
    And input case date "19/03/2566"
    And input accuser "ผู้กล่าวหา"
    And input suspect "ผู้ต้องหา"
    # And input offence "ความผิด"
    And Click button "เพิ่มของกลาง"
    And input type item "สายอากาศ"
    And input amount item "10"
    And input price item "500"
    And input date item "19/03/2566"
    And save item
    Then status pass item row "1"
    When Click button "ดำเนินการ"
    Then Show result "กรุณากรอกข้อมูลคดีให้ครบถ้วน"

  Scenario: Create item fail 1
    Given Go to NTBC homepage
    When Click left bar "ระบบจัดการของกลาง" page
    And Click button "เพิ่มรายการ"
    And input record "จำหน่าย"
    And input case date "19/03/2566"
    And input accuser "ผู้กล่าวหา"
    And input suspect "ผู้ต้องหา"
    And input offence "ความผิด"
    And Click button "เพิ่มของกลาง"
    # And input type item "สายอากาศ"
    And input amount item "10"
    And input price item "500"
    And input date item "19/03/2566"
    And save item
    # Then check detail item mandatory row "1"
    And status warning item row "1"
    When Click button "ดำเนินการ"
    Then Show result "ข้อมูลของกลางไม่ถูกต้อง"

  Scenario: Create item fail 2
    Given Go to NTBC homepage
    When Click left bar "ระบบจัดการของกลาง" page
    And Click button "เพิ่มรายการ"
    And input record "จำหน่าย"
    And input case date "19/03/2566"
    And input accuser "ผู้กล่าวหา"
    And input suspect "ผู้ต้องหา"
    And input offence "ความผิด"
    And Click button "เพิ่มของกลาง"
    And input type item "สายอากาศ"
    # And input amount item "10"
    And input price item "500"
    And input date item "19/03/2566"
    And save item
    # Then check detail item mandatory row "1"
    And status warning item row "1"
    When Click button "ดำเนินการ"
    Then Show result "ข้อมูลของกลางไม่ถูกต้อง"

  Scenario: Create item fail 3
    Given Go to NTBC homepage
    When Click left bar "ระบบจัดการของกลาง" page
    And Click button "เพิ่มรายการ"
    And input record "จำหน่าย"
    And input case date "19/03/2566"
    And input accuser "ผู้กล่าวหา"
    And input suspect "ผู้ต้องหา"
    And input offence "ความผิด"
    And Click button "เพิ่มของกลาง"
    And input type item "สายอากาศ"
    And input amount item "10"
    # And input price item "500"
    And input date item "19/03/2566"
    And save item
    # Then check detail item mandatory row "1"
    And status warning item row "1"
    When Click button "ดำเนินการ"
    Then Show result "ข้อมูลของกลางไม่ถูกต้อง"

  Scenario: Create item fail 4
    Given Go to NTBC homepage
    When Click left bar "ระบบจัดการของกลาง" page
    And Click button "เพิ่มรายการ"
    And input record "จำหน่าย"
    And input case date "19/03/2566"
    And input accuser "ผู้กล่าวหา"
    And input suspect "ผู้ต้องหา"
    And input offence "ความผิด"
    And Click button "เพิ่มของกลาง"
    And input type item "สายอากาศ"
    And input amount item "10"
    And input price item "500"
    # And input date item "19/03/2566"
    And save item
    # Then check detail item mandatory row "1"
    And status warning item row "1"
    When Click button "ดำเนินการ"
    Then Show result "ข้อมูลของกลางไม่ถูกต้อง"

  
  Scenario: Edit item warning to pass
    Given Go to NTBC homepage
    When Click left bar "ระบบจัดการของกลาง" page
    And Click button "เพิ่มรายการ"
    And input record "จำหน่าย"
    And input case date "19/03/2566"
    And input accuser "ผู้กล่าวหา"
    And input suspect "ผู้ต้องหา"
    And input offence "ความผิด"
    And Click button "เพิ่มของกลาง"
    And input type item "สายอากาศ"
    And input amount item "10"
    And input price item "500"
    And clear item date
    And save item
    Then status warning item row "1"
    When Click button "กลับไปแก้ไข"
    And input date item "19/03/2566"
    And save item
    Then status pass item row "1"

  Scenario: Edit item pass to warning
    Given Go to NTBC homepage
    When Click left bar "ระบบจัดการของกลาง" page
    And Click button "เพิ่มรายการ"
    And input record "จำหน่าย"
    And input date "19/03/2566"
    And input accuser "ผู้กล่าวหา"
    And input suspect "ผู้ต้องหา"
    And input offence "ความผิด"
    And Click button "เพิ่มของกลาง"
    And input type item "สายอากาศ"
    And input amount item "10"
    And input price item "500"
    And input date item "19/03/2566"
    And save item
    Then status warning item row "1"
    When Click button "กลับไปแก้ไข"
    Then clear item date
    And save item
    Then status pass item row "1"

  Scenario: Create draft All
    Given Go to NTBC homepage
    When Click left bar "ระบบจัดการของกลาง" page
    And Click button "เพิ่มรายการ"
    And input record "วิทยุสื่อสาร"
    And input case date "17/02/2566"
    And input accuser "ผู้กล่าวหา"
    And input suspect "ผู้ต้องหา"
    And input offence "ความผิด"
    And input mulct "100000"
    And input storage "P"
    And input note "เพิ่มเติม"
    And Click button "เพิ่มของกลาง"
    And input type item "ไมโครโฟนไร้สาย"
    And input brand item "sanyo"
    And input model item "sr-012"
    And input detail item "สีดำ"
    And input amount item "20"
    And input price item "2500"
    And input date item "07/03/2566"
    And input note item "ทดสอบ"
    And save item
    When Click button "บันทึกแบบร่าง"
    Then check draft accuser
    And check draft suspect
    And check draft case date

  Scenario: Create draft Madatory
    Given Go to NTBC homepage
    When Click left bar "ระบบจัดการของกลาง" page
    And Click button "เพิ่มรายการ"
    And input accuser "ผู้กล่าวหา"
    And input case date "19/03/2566"
    And input suspect "ผู้ต้องหา"
    When Click button "บันทึกแบบร่าง"
    Then check draft accuser
    And check draft suspect
    And check draft case date

  Scenario: Create draft Fail
    Given Go to NTBC homepage
    When Click left bar "ระบบจัดการของกลาง" page
    And Click button "เพิ่มรายการ"
    When Click button "บันทึกแบบร่าง"
    Then Show result "กรุณากรอกข้อมูล ผู้กล่าวหา หรือ ผู้ต้องหา หรือ วันที่ อย่างน้อย 1 รายการ"

  Scenario: Check detail draft
    Given Go to NTBC homepage
    When Click left bar "ระบบจัดการของกลาง" page
    And Click button "เพิ่มรายการ"
    And input record "วิทยุสื่อสาร"
    And input case date "17/02/2566"
    And input accuser "ผู้กล่าวหา"
    And input suspect "ผู้ต้องหา"
    And input offence "ความผิด"
    And input mulct "100000"
    And input storage "P"
    And input note "เพิ่มเติม"
    And Click button "เพิ่มของกลาง"
    And input type item "ไมโครโฟนไร้สาย"
    And input brand item "sanyo"
    And input model item "sr-012"
    And input detail item "สีดำ"
    And input amount item "20"
    And input price item "2500"
    And input date item "07/03/2566"
    And input note item "ทดสอบ"
    And save item
    And Click button "บันทึกแบบร่าง"
    # Then check draft accuser
    # And check draft suspect
    # And check draft case date
    Then Click last button "กลับไปแก้ไข"
    And check detail draft
    And check detail item all row "1"