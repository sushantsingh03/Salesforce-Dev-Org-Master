({
    handleClick : function (cmp, event, helper) {
        alert("You clicked: " + event.getSource().get("v.label"));
        alert(cmp.isValid());
        alert(cmp.getName());
        alert(cmp.get('v.wholeNumber'));
    }
});