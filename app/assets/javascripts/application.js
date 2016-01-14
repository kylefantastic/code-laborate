//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  registerForm()

  renderEditUserForm()
  editUserInfo()

  renderEditOrgInfo()
  editOrganizationInfo()

  renderEditProjectForm()
  editProjectInfo()
  chooseProject()

  bookmarkProject()
  unbookmarkProject()

  completeProject()
  abandonProject()

  orgForm()

  agreementConfirm()
  agreementAlert()
});

function registerForm(){
  $('#dev').click(function() {
    $('#devform').show();
    // $('#panel-dev').css('background-color','blue')
    // $('#devform').css('border-color','red')
    $("html,body").animate({ scrollTop: $('.jumbotron').height() }, "slow");
    $('#orgform').hide();
  })
  $('#org').click(function() {
    $('#orgform').show();
    // $('#orgform').css('border-style','solid')
    // $('#orgform').css('border-color','blue')
    // $(this).css('color','black');
    $("html,body").animate({ scrollTop: $('.jumbotron').height() }, "slow");
    $('#devform').hide();
  })
}



function orgForm(){
    $('html,body').animate({scrollTop: $('#new_org_form').height()}, "slow")
  }



function renderEditUserForm(){
  $('#developer-container').on("click", ".display-edit-developer-form", function(event){
    event.preventDefault()
    var userID = $("input").first().val()
    var request = $.ajax({
      url: "/users/" + userID + "/edit",
      type: "GET"
    })
    request.done(function(response){
      $('#developer-container').html(response)
    })
  })
}

function editUserInfo(){
  $('#developer-container').on("click", ".update-developer-profile", function(event){
    event.preventDefault()
    var userInfo = $(".edit-developer-form").serialize()
    var request = $.ajax({
      url: "/users/:id",
      type: "PUT",
      data: userInfo
    })
    request.done(function(response){
      $('#developer-container').html(response)
    })
  })
}

function renderEditOrgInfo(){
  $('#organization-container').on('click', '.edit-account', function(event){
    event.preventDefault()
    var orgId = $("#organization_id").val()
    var request = $.ajax({
      url: '/organizations/' + orgId + "/edit",
      type: "GET",
    })
    request.done(function(response){
      $('#organization-container').html(response)
    })
  })
}

function editOrganizationInfo(){
  $('#organization-container').on("click", ".update-org", function(event){
    event.preventDefault()
    var orgInfo = $("#edit-org-form").serialize()
    var orgId = $("#organization_id").val()
    var request = $.ajax({
      url: "/organizations/" + orgId,
      type: "PUT",
      data: orgInfo
    })
    request.done(function(response){
      $('#organization-container').html(response)
     })
    })
  }

function renderEditProjectForm(){
  $('#project-container').on("click", "#get-project-edit", function(e){
    e.preventDefault();
    var projectID = $('#project_id').val()
    var request = $.ajax({
      url: "/projects/" + projectID + "/edit",
      type: "GET"
    })
    request.done(function(response){
      $('#project-container').html(response)
    })
  })
}

function editProjectInfo(){
  $('#project-container').on("click", "#submit-project-update", function(e){
    e.preventDefault();
    var projectInfo = $("#project-edit-form").serialize()
    var projectID = $('#project_id').val()
    console.log("Got to editProjectInfo")
    var request = $.ajax({
      url: "/projects/" + projectID,
      type: "PUT",
      data: projectInfo
    })
    request.done(function(response){
      $('#project-container').html(response)

    })
  })
}

function chooseProject(){
  $('#project-container').on("click", "#choose-project", function(event){
    event.preventDefault();
    var projectID = $("#project_id").val()
    var currentUserID = $("#current_user_id").val()
    console.log({project: { id: projectID, developer_id: "" } })
    var request = $.ajax({
      url: "/projects/" + projectID,
      type: "PUT",
      data: {project: { id: projectID, developer_id: currentUserID}}
    })
    request.done(function(response){
      $('#project-container').html(response)
    })
  })
}

function completeProject(){
  $('#project-container').on("click", "#complete-project", function(event){
    event.preventDefault();
    var projectID = $("#project_id").val()
    var currentUserID = $("#current_user_id").val()
    var request = $.ajax({
      url: "/projects/" + projectID,
      type: "PUT",
      data: {project: { id: projectID, developer_id: ""}}
    })
    request.done(function(response){
      $('#project-container').html(response)
    })
  })
}

// Not yet sure how this will be different from complete project
function abandonProject(){
  $('#project-container').on("click", "#abandon-project", function(event){
    event.preventDefault();
    var projectID = $("#project_id").val()
    var currentUserID = $("#current_user_id").val()
    var request = $.ajax({
      url: "/projects/" + projectID,
      type: "PUT",
      data: {project: { id: projectID, developer_id: ""}}
    })
    request.done(function(response){
      $('#project-container').html(response)
    })
  })
}
// Possible to refactor chooseProject and editProjectInfo to use the same ajax and such. Identical except for click and projectInfo

function bookmarkProject(){
  $('#projects-container').on('click', '.fa-bookmark-o', function(e){
    e.preventDefault();
    var projectId = $(this).attr('id')
    projectId = projectId.match(/\d+/).join()
    var userId = $(this).parent().parent().attr('id')
    userId = userId.match(/\d+/).join()

    var data = {bookmark: {project_id: projectId, developer_id: userId}}

    var request = $.ajax({
      url: "/bookmarks",
      type: "POST",
      data: data
    })
    request.done(function(response){
      console.log(response)
      var newBookmark = $.parseHTML(response)
      var bookmarkID = $(newBookmark).attr('id')
      $('#' + bookmarkID).children().first().replaceWith(newBookmark)
    })
  })
}


function unbookmarkProject(){
  $('#projects-container').on('click', '.fa-bookmark', function(e){
    e.preventDefault();

    var projectId = $(this).attr('id')
    projectId = projectId.match(/\d+/).join()

    var userId = $(this).parent().parent().attr('id')
    userId = userId.match(/\d+/).join()

    var bookmarkId = $(this).attr('class') //third class listed
    bookmarkId = bookmarkId.split(" ")[2].slice(-2)
    var data = {bookmark: {project_id: projectId, developer_id: userId}}

    var request = $.ajax({
      url: "/bookmarks/" + bookmarkId,
      type: "DELETE",
      data: data
    })
    request.done(function(response){
      newBookmark = $.parseHTML(response)
      bookmarkID = $(newBookmark).attr('id')
      $('#' + bookmarkID).children().first().replaceWith(newBookmark)
      // now target the <li> with id project(numId)
    })
  })
}
  // onsubmit="if(document.getElementById('agree').checked) { return true; } else { alert('Please indicate that you have read and agree to the Terms and Conditions and Privacy Policy'); return false; }


function agreementConfirm(){
  $('.container').on('submit', '.sign-up-form', function(){
    // e.preventDefault();
    if(document.getElementById('agree').checked)
      { return true;
       }
    else { alert('Please indicate that you have read and agree to the Terms and Conditions and Privacy Policy'); return false; }
    });
}

function agreementAlert(){
  $('.container').on('click', '.agreement-alert', function(){
    alert("asdfl;ksadfsadlfkas;dlf;alksdf;lkadsfl;sadfjasdfjas")
  })
}




















