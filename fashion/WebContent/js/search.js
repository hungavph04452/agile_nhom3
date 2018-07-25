
var myUsers = ["freecodecamp", "storbeck", "terakilobyte", "habathcx","RobotCaleb","thomasballinger","noobs2ninjas","beohoff", "brunofin", "comster404"];
var userData = [];
var htmlOffline = "";
var htmlOnline = "";
var htmlInactive = "";
var count = 0;
var inactiveUsers = [];



function doSearch() {
  $(".groups").hide();
  $(".toggle").removeClass("active");
  $(".black-head").hide();
  username = $(".search-span > input").val().trim();
  $.getJSON('https://api.twitch.tv/kraken/channels/' +
    username +
    '?callback=?',
    function(data) {
      console.log(data);
      if (!data.hasOwnProperty("error")) {
        htmlSearch = "<div><a href='https://twitch.tv/" + username + "/profile' target='_blank'><span class='picture'><img src='" + (data.logo == null ? "https://www.jobvizz.com/images/member-profile-picture-placeholder1.png" : data.logo) + "'></span><span class='name'>" + data.display_name + "</span></a><span class='status'><!-- offline --></span><i class='material-icons add-search'>add</i></div>"
        $(".search-container").html(htmlSearch);
        $(".search-title > h2").html("Search Results");
        $(".search-container").show();
        $(".search-group").show();
        
      } else {
      $(".search-container").hide();
      $(".search-title > h2").html(username[0].toUpperCase() + username.substr(1) + " Not Found.")
      $(".search-group").show();
      };
      $(".search-span > input").val("");
    });
}

function addNewUser(fromSearch) {
  newUser = fromSearch ? fromSearch.toLowerCase().trim().replace(/\s/g, "") : $("#new-streamer-id").val().toLowerCase().trim();
  $.getJSON('https://api.twitch.tv/kraken/streams/' +
    newUser +
    '?callback=?',
    function(data) {
      if (!data.hasOwnProperty("error")) {
        myUsers.push(newUser);
        populateList();
        $(".add-wrap").hide();
        $("#new-streamer-id").val("");
        $(".error-message").hide();
      } else {
        $(".error-message").show();
        $(".error-message").text("Cannot add " + newUser + " as the account either never existed or is inactive. Please check the spelling of the username and try again.");
        $("#new-streamer-id").val("");
        $("#new-streamer-id").focus();
      }
    });

}

function renderList(str) { // This function merely
  // renders and shows the list.
  $(".groups").show();
  $(".search-group").hide();
  $(".clear-skies").hide();
  str = str === undefined ? "All" : str.trim();

  switch (str) {
    case "All":
      if (htmlOnline + htmlOffline + htmlInactive != "") {
        if (htmlOnline != "") {
          $(".online-container").html(htmlOnline);
          $(".online-container").show();
          $(".online-title").show();
        } else {
          $(".online-container").hide();
          $(".online-title").hide();
          $(".online-container").html("");
        }
        if (htmlOffline != "") {
          $(".offline-container").html(htmlOffline);
          $(".offline-container").show();
          $(".offline-title").show();
        } else {
          $(".offline-container").hide();
          $(".offline-title").hide();
          $(".offline-container").html("");
        }
        if (htmlInactive != "") {
          $(".inactive-container").html(htmlInactive);
          $(".inactive-container").show();
          $(".inactive-title").show();
        } else {
          $(".inactive-container").hide();
          $(".inactive-title").hide();
          $(".inactive-container").html("");
        }
      } else {
        $(".online-container").hide();
        $(".online-title").hide();
        $(".offline-container").hide();
        $(".offline-title").hide();
        $(".inactive-container").hide();
        $(".inactive-title").hide();
        $(".clear-skies").css({
          "display": "flex"
        });
        $(".clear-skies > p").text("There's nothing here! Try adding your favorite Twitch channels.");
      }
      if (inactiveUsers.length > 0) {
        $(".inactive-number").text(inactiveUsers.length);
        $(".inactive-word").text(inactiveUsers.length === 1 ? "account" : "accounts");
        $(".them-it").text(inactiveUsers.length === 1 ? "it" : "them");
        $(".black-head").show();
      }
      break;
    case "Online":
      if (htmlOnline != "") {
        $(".online-container").html(htmlOnline);
        $(".online-container").show();
        $(".online-title").show();
      } else {
        $(".online-container").hide();
        $(".online-title").hide();
        $(".clear-skies").css({
          "display": "flex"
        });
        $(".clear-skies > p").text(myUsers.length === 0 ? "There's nothing here! Try adding your favorite Twitch channels." : "None of the channels you are monitoring are online.");
      }
      $(".offline-container").hide();
      $(".offline-title").hide();
      $(".inactive-container").hide();
      $(".inactive-title").hide();
      break;
    case "Offline":
      $(".online-container").hide();
      $(".online-title").hide();
      if (htmlOffline != "") {
        $(".offline-container").html(htmlOffline);
        $(".offline-container").show();
        $(".offline-title").show();
      } else {
        $(".offline-container").hide();
        $(".offline-title").hide();
        $(".clear-skies").css({
          "display": "flex"
        });
        $(".clear-skies > p").text(myUsers.length === 0 ? "There's nothing here! Try adding your favorite Twitch channels." : "None of the channels you are monitoring are offline.");
      }
      $(".inactive-container").hide();
      $(".inactive-title").hide();
  }
  $(".toggle-bar").show();
  
}

function populateList(searchQuery) { // This function grabs the data from
  // The API and creates the list.

  var list = myUsers;
  if (searchQuery) {
    $(".online-group").hide();
    $(".offline-group").hide();
    $(".inactive-group").hide();
    $(".search-group").show();
  } else {
    userData = [];
    htmlOffline = "";
    htmlOnline = "";
    htmlInactive = "";
    inactiveUsers = [];
    count = 0;
    if (list.length === 0) {
      renderList();
    }
    list.forEach(function(username) {
      $.getJSON('https://api.twitch.tv/kraken/streams/' +
        username +
        '?callback=?',
        function(data) {
          if (data.hasOwnProperty("stream")) { // If there is stream data, parse it.
            $.getJSON('https://api.twitch.tv/kraken/channels/' +
              username +
              '?callback=?',
              function(channel) {
                if (data.stream == null) {
                  htmlOffline += "<div><a href='https://twitch.tv/" + username + "/profile' target='_blank'><span class='picture'><img src='" + (channel.logo == null ? "https://www.jobvizz.com/images/member-profile-picture-placeholder1.png" : channel.logo) + "'></span><span class='name'>" + channel.display_name + "</span></a><span class='status'><!-- offline --></span><i class='material-icons clear'>clear</i></div>"
                  count++;

                  if (count == list.length) {
                    renderList($(".active").text());
                  };
                  userData.push(data);
                } else { // Else, add the user to the online list.
                  userData.push(data);
                  htmlOnline += "<div><a href='https://twitch.tv/" + username + "/profile' target='_blank'><span class='picture'><img src='" + (channel.logo == null ? "https://www.jobvizz.com/images/member-profile-picture-placeholder1.png" : channel.logo) + "'></span><span class='name'>" + channel.display_name + "</span></a><span class='status'><a href='https://twitch.tv/" + username + "' target='_blank'>" + data.stream.game + "</a></span><span class='clear'><i class='material-icons'>clear</i></span></div>"
                  count++;

                  if (count == list.length) {
                    renderList($(".active").text());
                  };
                }
              })

          } else {
            htmlInactive += "<div><span class='picture'><img src='" + "https://www.jobvizz.com/images/member-profile-picture-placeholder1.png" + "'></span><span class='name inactive'>" + username + "</span><span class='status'><!-- inactive --></span><span class='clear'><i class='material-icons'>clear</i></span></div>"
            inactiveUsers.push(username);
            count++;
            if (count == list.length) {
              renderList($(".active").text());
            };
            userData.push(data); // Adds the user to the inactive list.
          }
        });
    });
  }
}

$(document).ready(function() {
$("#custom-preview").hide();
 
  
  populateList();
  $(".add-new-btn").hover(function() {
    $(".tool-tip, .tool-tip-tri").css({
      "display": "block"
    });
  }, function() {
    $(".tool-tip, .tool-tip-tri").css({
      "display": "none"
    });
  });

  $(".add-new-btn").click(function() {
    $(".tool-tip, .tool-tip-tri").css({
      "display": "none"
    });
    $(".add-wrap").show();
    $("#new-streamer-id").focus();
  });
  $(".add-window button").click(function() {
    addNewUser();
  });

  $("#new-streamer-id").on("keypress", function(e) {
    if (e.keyCode == 13) {
      addNewUser();
      return false;
    }
  });

  $(".add-wrap").click(function(e) {
    if (e.target == this) {
      $(this).hide();
      $("#new-streamer-id").val("");
      $(".error-message").hide();
    }
  });

  $(document).keyup(function(e) {
    if (e.keyCode == 27) {
      $(".add-wrap").hide();
      $(".add-wrap").hide();
      $("#new-streamer-id").val("");
      $(".error-message").hide();
    }
  });

  $(".search").click(function() {
    doSearch();
  });

  $(".search-span > input").keyup(function(e) {
    if (e.keyCode == 13) {
      doSearch();
      return false;
    }
  });

  $('.content').on('click', '.clear', function() {
    linkVal = $(this).siblings("a").text().toLowerCase();
    spanVal = $(this).siblings("span").text().toLowerCase()
    
    myUsers.splice(myUsers.indexOf(linkVal ? linkVal : spanVal), 1);
    if ($(this).parent().parent().children().length === 1) {
      $(this).parent().parent().parent().hide();
      populateList();
      $(".black-head").hide();
    }
    $(this).parent().remove();
  });
  
  $('.content').on('click', '.add-search', function() {
    $(".toggle:nth-of-type(1)").addClass("active");
    addNewUser($(this).siblings("a").text().toLowerCase());
  });

  $(".yes").click(function() {
    myUsers = myUsers.filter(function(user) {
      return inactiveUsers.indexOf(user) < 0;
    });
    populateList();
    $(".black-head").hide();
  })

  $(".no").click(function() {
    $(".black-head").hide();
  });

  $(".toggle").click(function() {
    $(".active").removeClass("active");
    $(this).addClass("active");
    renderList($(this).text());
  });

  $(".fa-twitch").click(function() {
    //
  });
  

});