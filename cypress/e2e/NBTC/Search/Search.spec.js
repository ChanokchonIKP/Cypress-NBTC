import moment from 'moment';
const { Given, When, Then, Before} = require('@badeball/cypress-cucumber-preprocessor');
let type;
let brand;
let model;
let sdate;
let edate;
let typeitem;
let branditem;
let modelitem;
let detailitem;
let amountitem;
let priceitem;
let dateitem;
let noteitem;

let recordinput;
let dateinput;
let accuserinput;
let suspectinput;
let offenceinput;
let storageinput;
let noteinput;
let mulctinput;

Before(() => {
    cy.viewport(1600, 720);
});

Given('Go to NTBC homepage', () => {
  cy.visit('http://10.1.0.101:31429/main/menu');
});

When('Click left bar {string} page', (menu) => {
  cy.get('div').contains(menu).click();
});

When('input type {string}', (type_input) => {
  cy.get('#combo-box').type(type_input);
  cy.get('#combo-box-option-0').click();
  type = type_input;
});

When('input brand {string}', (brand_input) => {
  cy.get('#tradeMark').type(brand_input);

  brand = brand_input;
});

When('input model {string}', (model_input) => {
  cy.get('#model').type(model_input);

  model = model_input;
});

When('input startdate {string}', (sdateinput) => {
  cy.get('#\\:r4\\:').type(sdateinput);

  sdate = sdateinput;
});

When('input enddate {string}', (edateinput) => {
  cy.get('#\\:r5\\:').type(edateinput);

  edate = edateinput;
});

// When('เลือกวันที่ Start', () => {
//   cy.get('.DatePickerStart > .MuiInputBase-root > .MuiInputAdornment-root > .MuiButtonBase-root').click()
//   cy.get('#\\:r8\\:-grid-label').click();
//   cy.get(':nth-child(122) > .PrivatePickersYear-yearButton').click();
//   cy.get('.MuiDayPicker-monthContainer > :nth-child(3) > :nth-child(4)').click();
// });

// When('เลือกวันที่ End', () => {
//   cy.get('.DatePickerEnd > .MuiInputBase-root > .MuiInputAdornment-root > .MuiButtonBase-root').click();
//   cy.get('#\\:r9\\:-grid-label').click();
//   cy.get(':nth-child(123) > .PrivatePickersYear-yearButton').click();
//   cy.get('.MuiDayPicker-monthContainer > :nth-child(3) > :nth-child(4)').click();
// });

When('Click button {string}', (click) => {
    cy.get('button').contains(click).click();
    // cy.get('div').contains('p','ทำการเรียกข้อมูลสำเร็จ');
});

When('click detail {string}', (numdetail) => {
  cy.get(':nth-child(1) > :nth-child(7) > :nth-child('+numdetail+') > .MuiGrid-root > .MuiButtonBase-root').click();
});

Then('check detail type', () => {
  cy.get('tbody th:nth-child(1)').contains('p',type).should('exist');
});

Then('check detail brand', () => {
  cy.get('tbody th:nth-child(2)').contains('p',brand).should('exist');
});

Then('check detail model', () => {
  cy.get('tbody th:nth-child(3)').contains('p',model).should('exist');
});

When('edit', () => {
  cy.get('button').contains('แก้ไขรายละเอียด').click();
  cy.get('#fine-textbox').clear().type('model');
  cy.get('#location-textbox').clear().type('model');
  cy.get('#case-textbox').clear().type('model');
  cy.get('button').contains('บันทึก').click();
});

Then('check results within the date range', () => {
  const start = moment(sdate, "DD/MM/YYYY");
  const end = moment(edate, "DD/MM/YYYY");
  cy.get('tbody th:nth-child(2)').each(($row) => {
    const dateString = $row.find('p').text();
    const date = moment(dateString, 'DD/MM/YYYY');
    expect(date.isBetween(start, end, null, '[]')).to.be.true;
  });
});

Then('Show result {string}', (text) => {
  cy.get('div').contains(text);
});

Then('Check date to be less or equal than enddate', () => {
  const enddate = moment(edate, "DD/MM/YYYY");
  cy.get('tbody th:nth-child(2)').each(($row) => {
    const dateString = $row.find('p').text();
    const end = moment(dateString, 'DD/MM/YYYY');
    cy.log('data :' ,enddate )
    expect(end <= enddate).to.be.true;
  });
});

Then('Check date to be more or equal than startdate', () => {
  const today = new Date();
  cy.get('tbody th:nth-child(2)').each(($row) => {
    const dateString = $row.find('p').text();
    const start = moment(dateString, 'DD/MM/YYYY');
    expect(start >= today).to.be.true;
  });
});

When('input record {string}', (record_input) => {
  cy.get(':nth-child(1) > .MuiGrid-grid-xs-6 > .MuiFormControl-fullWidth > .MuiFormControl-root > .MuiInputBase-root > #location-textbox').type(record_input);
  recordinput = record_input;
});

When('input case date {string}', (date_input) => {
  
  cy.get(':nth-child(2) > .MuiGrid-grid-xs-3 > .MuiFormControl-fullWidth > .MuiFormControl-root > .MuiInputBase-root input').clear().type(date_input);
  dateinput = date_input;
});

When('clear case date', () => {
  
  cy.get(':nth-child(2) > .MuiGrid-grid-xs-3 > .MuiFormControl-fullWidth > .MuiFormControl-root > .MuiInputBase-root input').clear();
});

When('clear item date', () => {
  
  cy.get(':nth-child(5) > .MuiGrid-container > :nth-child(2) > .MuiFormControl-fullWidth > .MuiFormControl-root > .MuiInputBase-root input').clear();
});

When('input accuser {string}', (accuser_input) => {
  
  cy.get(':nth-child(3) > .MuiGrid-grid-xs-6 > .MuiFormControl-fullWidth > .MuiFormControl-root > .MuiInputBase-root > #location-textbox').type(accuser_input);
  accuserinput = accuser_input;
});

When('input suspect {string}', (suspect_input) => {
  
  cy.get(':nth-child(4) > .MuiGrid-grid-xs-6 > .MuiFormControl-fullWidth > .MuiFormControl-root > .MuiInputBase-root > #location-textbox').type(suspect_input);
  suspectinput = suspect_input;
});

When('input offence {string}', (offence_input) => {
  
  cy.get('#case-textbox').type(offence_input);
  offenceinput = offence_input;

});

When('input mulct {string}', (mulct_input) => {
  cy.get('.PrivateSwitchBase-input').click();
  cy.get('#fine-textbox').type(mulct_input);
  mulctinput = mulct_input;

});

When('input storage {string}', (storage_input) => {
  
  cy.get(':nth-child(2) > .MuiGrid-grid-xs-6 > .MuiFormControl-fullWidth > .MuiFormControl-root > .MuiInputBase-root > #location-textbox').type(storage_input);
  storageinput = storage_input;
});

When('input note {string}', (note_input) => {
  
  cy.get(':nth-child(3) > .MuiGrid-grid-xs-6 > .MuiFormControl-fullWidth > .MuiFormControl-root > .MuiInputBase-root > #case-textbox').type(note_input);
  noteinput = note_input;
});

When('input type item {string}', (type_item) => {
  
  cy.get('#combo-box').type(type_item);
  cy.get('#combo-box-option-0').click();
  // cy.get(':nth-child(1) > .MuiGrid-container > :nth-child(2) > .MuiFormControl-fullWidth > .MuiFormControl-root > .MuiInputBase-root > #fine-textbox').type(type_item);
  typeitem = type_item;
});

When('input brand item {string}', (brand_item) => {
  
  cy.get(':nth-child(2) > .MuiGrid-container > :nth-child(2) > .MuiFormControl-fullWidth > .MuiFormControl-root > .MuiInputBase-root > #fine-textbox').type(brand_item);
  branditem = brand_item;
});

When('input model item {string}', (model_item) => {
  
  cy.get(':nth-child(3) > :nth-child(1) > :nth-child(2) > .MuiFormControl-fullWidth > .MuiFormControl-root > .MuiInputBase-root > #fine-textbox').type(model_item);
  modelitem = model_item;
});

When('input detail item {string}', (detail_item) => {
  
  cy.get(':nth-child(3) > :nth-child(2) > :nth-child(2) > .MuiFormControl-fullWidth > .MuiFormControl-root > .MuiInputBase-root > #fine-textbox').type(detail_item);
  detailitem = detail_item;
});

When('input amount item {string}', (amount_item) => {
  
  cy.get(':nth-child(4) > :nth-child(1) > :nth-child(2) > .MuiFormControl-fullWidth > .MuiFormControl-root > .MuiInputBase-root > #fine-textbox').type(amount_item);
  amountitem = amount_item;
});

When('input price item {string}', (price_item) => {
  
  cy.get(':nth-child(4) > :nth-child(2) > :nth-child(2) > .MuiFormControl-fullWidth > .MuiFormControl-root > .MuiInputBase-root > #fine-textbox').type(price_item);
  priceitem = price_item;
});

When('input date item {string}', (date_item) => {
  
  cy.get(':nth-child(5) > .MuiGrid-container > :nth-child(2) > .MuiFormControl-fullWidth > .MuiFormControl-root > .MuiInputBase-root input').clear().type(date_item);
  dateitem = date_item;
});

When('input note item {string}', (note_item) => {
  
  cy.get(':nth-child(6) > .MuiGrid-container > :nth-child(2) > .MuiFormControl-fullWidth > .MuiFormControl-root > .MuiInputBase-root > #fine-textbox').type(note_item);
  noteitem = note_item;
});

When('save item', () => {

  cy.get('.css-8e4lkk > .MuiButtonBase-root').click();
})

// Then('check type item row {string}', (row) => {
//   cy.get('tbody :nth-child(2) > :nth-child('+row+')').contains('p',typeitem).should('exist');
// })

// Then('check brand item row {string}', (row) => {
//   cy.get('tbody :nth-child(3) > :nth-child('+row+')').contains('p',branditem).should('exist');
// })

// Then('check model item row {string}', (row) => {
//   cy.get('tbody :nth-child(4) > :nth-child('+row+')').contains('p',modelitem).should('exist');
// })

// Then('check amount item row {string}', (row) => {
//   cy.get('tbody :nth-child(5) > :nth-child('+row+')').contains('p',amountitem).should('exist');
// })

// Then('check price item row {string}', (row) => {
//   cy.get('tbody :nth-child(6) > :nth-child('+row+')').contains('p',priceitem).should('exist');
// })

// Then('check date item row {string}', (row) => {
//   cy.get('tbody :nth-child(7) > :nth-child('+row+')').contains('p',dateitem).should('exist');
// })

// Then('check detail item row {string}', (row) => {
//   cy.get('tbody :nth-child(8) > :nth-child('+row+')').contains('p',detailitem).should('exist');
// })

// Then('check note item row {string}', (row) => {
//   cy.get('tbody :nth-child(9) > :nth-child('+row+')').contains('p',noteitem).should('exist');
// })

Then('status pass item row {string}', (row) => {
  cy.get('tbody :nth-child(1) > :nth-child('+row+') [data-testid="CheckCircleIcon"]').should('exist');
})

Then('status warning item row {string}', (row) => {
  cy.get('tbody :nth-child(1) > :nth-child('+row+') [data-testid="WarningIcon"]').should('exist');
})

Then('check detail case all', () => {
  cy.get('div.MuiGrid-root.MuiGrid-item.MuiGrid-grid-xs-6.css-1s50f5r > p').contains(recordinput).should('exist');
  cy.get('div.MuiGrid-root.MuiGrid-item.MuiGrid-grid-xs-6.css-1s50f5r > p').contains(dateinput).should('exist');
  cy.get('div.MuiGrid-root.MuiGrid-item.MuiGrid-grid-xs-6.css-1s50f5r > p').contains(accuserinput).should('exist');
  cy.get('div.MuiGrid-root.MuiGrid-item.MuiGrid-grid-xs-6.css-1s50f5r > p').contains(suspectinput).should('exist');
  cy.get('div.MuiGrid-root.MuiGrid-item.MuiGrid-grid-xs-6.css-1s50f5r > p').contains(offenceinput).should('exist');
  cy.get('div.MuiGrid-root.MuiGrid-item.MuiGrid-grid-xs-6.css-1s50f5r > p').contains(storageinput).should('exist');
  cy.get('div.MuiGrid-root.MuiGrid-item.MuiGrid-grid-xs-6.css-1s50f5r > p').contains(noteinput).should('exist');
  cy.get('div.MuiGrid-root.MuiGrid-item.MuiGrid-grid-xs-6.css-1s50f5r > p').contains(mulctinput).should('exist');

});

Then('check detail case mandatory', () => {
  cy.get('div.MuiGrid-root.MuiGrid-item.MuiGrid-grid-xs-6.css-1s50f5r > p').contains(recordinput).should('exist');
  cy.get('div.MuiGrid-root.MuiGrid-item.MuiGrid-grid-xs-6.css-1s50f5r > p').contains(dateinput).should('exist');
  cy.get('div.MuiGrid-root.MuiGrid-item.MuiGrid-grid-xs-6.css-1s50f5r > p').contains(accuserinput).should('exist');
  cy.get('div.MuiGrid-root.MuiGrid-item.MuiGrid-grid-xs-6.css-1s50f5r > p').contains(suspectinput).should('exist');
  cy.get('div.MuiGrid-root.MuiGrid-item.MuiGrid-grid-xs-6.css-1s50f5r > p').contains(offenceinput).should('exist');
  // cy.get('div.MuiGrid-root.MuiGrid-item.MuiGrid-grid-xs-6.css-1s50f5r > p').contains(storageinput).should('exist');
  // cy.get('div.MuiGrid-root.MuiGrid-item.MuiGrid-grid-xs-6.css-1s50f5r > p').contains(noteinput).should('exist');
  // cy.get('div.MuiGrid-root.MuiGrid-item.MuiGrid-grid-xs-6.css-1s50f5r > p').contains(mulctinput).should('exist');

});

Then('check detail item all row {string}', (row) => {

  cy.get('tbody :nth-child('+row+')').contains('p',typeitem).should('exist');
  cy.get('tbody :nth-child('+row+')').contains('p',branditem).should('exist');
  cy.get('tbody :nth-child('+row+')').contains('p',modelitem).should('exist');
  cy.get('tbody :nth-child('+row+')').contains('p',amountitem).should('exist');
  cy.get('tbody :nth-child('+row+')').contains('p',priceitem).should('exist');
  cy.get('tbody :nth-child('+row+')').contains('p',dateitem).should('exist');
  cy.get('tbody :nth-child('+row+')').contains('p',detailitem).should('exist');
  cy.get('tbody :nth-child('+row+')').contains('p',noteitem).should('exist');
})

Then('check detail item mandatory row {string}', (row) => {

  cy.get('tbody :nth-child('+row+')').contains('p',typeitem).should('exist');
  cy.get('tbody :nth-child('+row+')').contains('p',amountitem).should('exist');
  cy.get('tbody :nth-child('+row+')').contains('p',priceitem).should('exist');
  cy.get('tbody :nth-child('+row+')').contains('p',dateitem).should('exist');

})

Then('check draft accuser', () => {

  cy.get('tbody th:nth-child(1)').last().contains('p',accuserinput).should('exist');

})

Then('check draft suspect', () => {

  cy.get('tbody th:nth-child(2)').last().contains('p',suspectinput).should('exist');

})

Then('check draft case date', () => {

  cy.get('tbody th:nth-child(3)').last().contains('p',dateinput).should('exist');

})

Then('Click last button {string}', (click) => {

  cy.get('tbody th').last().contains('button',click).click();

})

When('check detail draft', () => {
  cy.log('test : ',recordinput)
  cy.get(':nth-child(1) > .MuiGrid-grid-xs-6 > .MuiFormControl-fullWidth > .MuiFormControl-root > .MuiInputBase-root > #location-textbox').should('have.value', recordinput)
  cy.get(':nth-child(2) > .MuiGrid-grid-xs-3 > .MuiFormControl-fullWidth > .MuiFormControl-root > .MuiInputBase-root input').should('have.value', dateinput);
  cy.get(':nth-child(3) > .MuiGrid-grid-xs-6 > .MuiFormControl-fullWidth > .MuiFormControl-root > .MuiInputBase-root > #location-textbox').should('have.value', accuserinput);
  cy.get(':nth-child(4) > .MuiGrid-grid-xs-6 > .MuiFormControl-fullWidth > .MuiFormControl-root > .MuiInputBase-root > #location-textbox').should('have.value', suspectinput);
  cy.get('#case-textbox').should('have.value', offenceinput);
  cy.get('#fine-textbox').should('have.value', mulctinput);
  cy.get(':nth-child(2) > .MuiGrid-grid-xs-6 > .MuiFormControl-fullWidth > .MuiFormControl-root > .MuiInputBase-root > #location-textbox').should('have.value', storageinput);
  cy.get(':nth-child(3) > .MuiGrid-grid-xs-6 > .MuiFormControl-fullWidth > .MuiFormControl-root > .MuiInputBase-root > #case-textbox').should('have.value', noteinput);

});