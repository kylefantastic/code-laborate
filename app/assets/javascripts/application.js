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
  appendHover()
});

function appendHover(){
  $( "a" ).hover(function() {
    $( this ).toggleClass( "red" );
  })
}


function registerForm(){
  $('#dev').click(function() {
    $('#devform').show();
    $('#orgform').hide();
  })
  $('#org').click(function() {
    $('#orgform').show();
    $('#devform').hide();
  })
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
// Possible to refactor chooseProject and editProjectInfo to use the same ajax and such. Identical except for click and projectInfo

