Feature: NBTC
  Scenario: Search for a keyword All
    Given I am on the NTBC homepage
    When left bar Go to "ระบบจัดการของกลาง" page
    And input type "วิทยุสื่อสาร"
    And input brand "BAOFENG"
    And input model "UV5R"
    # And input startdate "30/04/2563"
    # And input enddate "30/04/2563"
    And Click button "ค้นหา"
    Then Show result "ทำการเรียกข้อมูลสำเร็จ"
    When click detail "1"
    Then check detail type
    Then check detail brand
    Then check detail model
    # Then check results within the date range
  
  Scenario: Search for a keyword Type
    Given I am on the NTBC homepage
    When left bar Go to "ระบบจัดการของกลาง" page
    And input type "วิทยุสื่อสาร"
    # And input startdate "24/04/2563"
    # And input enddate "24/04/2563"
    And Click button "ค้นหา"
    Then Show result "ทำการเรียกข้อมูลสำเร็จ"
    When click detail "1"
    Then check detail type

  Scenario: Search for a keyword Brand
    Given I am on the NTBC homepage
    When left bar Go to "ระบบจัดการของกลาง" page
    And input brand "BAOFENG"
    # And input startdate "24/04/2563"
    # And input enddate "24/04/2563"
    And Click button "ค้นหา"
    Then Show result "ทำการเรียกข้อมูลสำเร็จ"
    When click detail "1"
    Then check detail brand

  Scenario: Search for a keyword Model
    Given I am on the NTBC homepage
    When left bar Go to "ระบบจัดการของกลาง" page
    And input model "UV5R"
    # And input startdate "24/04/2563"
    # And input enddate "24/04/2563"
    And Click button "ค้นหา"
    Then Show result "ทำการเรียกข้อมูลสำเร็จ"
    When click detail "1"
    Then check detail model

  Scenario: Search for a Full Date
    Given I am on the NTBC homepage
    When left bar Go to "ระบบจัดการของกลาง" page
    And input startdate "27/02/2566"
    And input enddate "27/02/2566"
    And Click button "ค้นหา"
    Then Show result "ทำการเรียกข้อมูลสำเร็จ"
    Then check results within the date range

  Scenario: Search for a Enddate
    Given I am on the NTBC homepage
    When left bar Go to "ระบบจัดการของกลาง" page
    And input enddate "27/02/2566"
    And Click button "ค้นหา"
    Then Show result "ทำการเรียกข้อมูลสำเร็จ"
    Then Check date to be less or equal than enddate

  Scenario: Search for a keyword All no result
    Given I am on the NTBC homepage
    When left bar Go to "ระบบจัดการของกลาง" page
    And input type "วิทยุสื่อสาร"
    And input brand "B"
    And input model "U"
    And input startdate "27/02/2566"
    And input enddate "27/02/2566"
    And Click button "ค้นหา"
    Then Show result "ไม่พบรายการของกลางที่ค้นหา"