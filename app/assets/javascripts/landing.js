var app = angular.module("Hi5Exchange", ["ngResource"]);
// ######################################################
// ################# landingPageController #################
// ######################################################

// ################# Routes #####################
app.factory('User', ['$resource', function($resource){
  return $resource('/users/:id.json', {id: '@id'}, {update: {method: 'PUT'}});
}]);

app.controller('landingPageController', ['$scope', '$rootScope', '$resource', 'User',
  function($scope, $rootScope, $resource, User){

    current_user_function = $('#current_user_function').val();
    if (current_user_function && (
        current_user_function === "admin" ||
        current_user_function === "super_admin"
      )) {
      $rootScope.isAdmin = true;
      $rootScope.isRecycler = false;
      $rootScope.isRedeemer = false;
    }

    if (current_user_function && (
        current_user_function === "recycler"
      )) {
      $rootScope.isAdmin = false;
      $rootScope.isRecycler = true;
      $rootScope.isRedeemer = false;
    }

    if (current_user_function && (
        current_user_function === "redeemer"
      )) {
      $rootScope.isAdmin = false;
      $rootScope.isRecycler = false;
      $rootScope.isRedeemer = true;
    }

    if (!current_user_function) {
      $scope.hideBanner = false;
    } else {
      $scope.hideBanner = false;
    }

    $scope.landingPageBullets = [
      "Register as a recycler with the nonprofit group of your choice",
      "Your participation will help your chosen group raise money for their programs",
      "Log in any time to request a pickup",
      "Your group will be notified of your request",
      "You’ll receive email and text notification once they've selected your job",
      "You have just helped a local nonprofit and contributed to local sustainability efforts!",
      "Congratulations!"
    ];

    $scope.recyclerRules = [
      "Register with a group of your choice.",
      "Log in anytime to request a redeemer from your group to pick up your recycling.",
      "Only redeemers from your group will be able to see this information and claim the job.",
      "Once a redeemer has claimed your pickup, you’ll be notified by email and text.",
      "They’ll have 24 hours to remove your bags.",
      "Don’t forget to take your bags of redeemables outside!",
      "Please be courteous - put the bags somewhere visible to make sure it’s obvious for your redeemer.",
      "When your redeemer has completed your pickup, you’ll be notified by email and text.",

    ];
    $scope.redeemerRules = [
      "Register as a redeemer, then log in anytime to see if there are any redeemables you’d like to pick up for cash.",
      "You will be notified by email and text when a job is available for pickup in your area.",
      "Once you’ve selected a job for pick up, it is your responsibility to complete it!",
      "(The listing will no longer be visible to other redeemers.)",
      "You’ll have 24 hours to pick up the redeemables.",
      "Please be courteous - do not claim a job unless you intend to pick it up within that time frame!",
      "Check the “complete” box after you have completed the pickup.",
      "(This will trigger a text to the recycler to let them know the transaction is complete.)"
    ];

    $scope.welcomeComments = [
      "Register as a recycler, and post anytime to have someone from the Maui 76 Composite Squadron at Civil Air Patrol pick up your recycling for proper disposal. Free."
    ];

    $scope.terms = "WELCOME TO HI5exchange. By accessing our servers, websites, or content therefrom (together, \"HI5\"), " +
    "you agree to these Terms of Use (\"TOU\"), last updated January 7, 2014. \n" +
    "LICENSE. If you are 18 or older, we grant you a limited, revocable, nonexclusive, " +
    "nonassignable, nonsublicensable license to access HI5 in compliance with the TOU; " +
    "unlicensed access is unauthorized. You may not license, distribute, " +
    "make derivative works, display, sell, or \"frame\" content from HI5. " +
    "We reserve a perpetual, irrevocable, unlimited, worldwide, fully paid/sublicensable " +
    "license to use, copy, perform, display, distribute, and make derivative works " +
    "from content you post. \n" +
    "USE. You may not use or provide software (except for general purpose web browsers " +
    "and email clients, or software expressly licensed by us) or services that interact " +
    "or interoperate with HI5, e.g., for downloading, uploading, posting, flagging, " +
    "emailing, search, or mobile use. Robots, spiders, scripts, scrapers, crawlers, etc. " +
    "are prohibited, as are misleading, unsolicited, unlawful, and/or spam postings/email. " +
    "You may not collect users' personal and/or contact information (\"PI\").\n" +
    "MODERATION. We may moderate HI5 access and use in our sole discretion, e.g., " +
    "by blocking (e.g., IP addresses), filtering, deletion, delay, omission, " +
    "verification, and/or access/account/license termination. You may not bypass " +
    "said moderation. We are not liable for moderating, not moderating, or " +
    "representations as to moderating, and nothing we say or do waives our right " +
    "to moderate, or not.\n" +
    "HI5 makes no promises or representations of any kind concerning the safety, " +
    "availability, timeliness or reliability of its services, the identity of its users, " +
    "or the accuracy of the information provided by its users. Access and use of Hi5, " +
    "including any communication or contact with others, are entirely at your own risk.\n" +
    "HI5 AND ITS OFFICERS, DIRECTORS, EMPLOYEES, AGENTS, AFFILIATES, SUCCESSORS AND ASSIGNS " +
    "ARE NOT LIABLE IN CONTRACT OR TORT OR BY STATUTE FOR ANY HARM TO PERSON OR PROPERTY " +
    "WHATSOEVER, INCLUDING INCIDENTAL, SPECIAL, CONSEQUENTIAL OR PUNITIVE DAMAGES, " +
    "RESULTING DIRECTLY OR INDIRECTLY FROM HI5’S WEBSITE OR OPERATIONS OR FROM ANY " +
    "CONDUCT BY ANY OF ITS USERS. YOU AGREE TO INDEMNIFY AND HOLDHARMLESS HI5, ITS OFFICERS, " +
    "DIRECTORS, EMPLOYEES, AGENTS, AFFILIATES, SUCCESSORS OR ASSIGNS FROM ANY AND ALL " +
    "CLAIMS, LOSSES OR DEMANDS, INCLUDING ATTORNEY'S FEES, MADE BY ANY THIRD PARTY " +
    "ARISING FROM YOUR USE OF HI-5’s WEBSITE OR SERVICES RELATED TO ANY VIOLATION OF " +
    "THESE TERMS AND CONDITIONS, OR ARISING FROM YOUR VIOLATION OF ANY RIGHTS OF A THIRD PARTY."

    $scope.agreeToTerms = "I agree with the Terms and Conditions.";

    $scope.pwdLength = "Password must be 6 characters or more.";
    $scope.textAndEmail = "Enter your phone number If you wish to receive text message notification of transaction events. Highly recommended.";
    $scope.selectRedeemerGroup = "Please select a group to pick up your recycleables."
    $scope.conditions = "I agree with the Terms and Conditions.";


    $scope.setAvailableGroups = function (groups) {
      var group, i, length = groups.length;
      $scope.data = {
        groupOptions: [],
        selectedGroupOption: {}
      }
      $scope.selectedGroupOption = {};
      for(i = 0; i < length; i++) {
          group = groups[i];
          if (group.name !== "Admin") {
               $scope.data.groupOptions.push({
                                          name: group.name,
                                          value: group.id
                                        });
          }
      }
    };

    User.query($scope.setAvailableGroups);

    var user = $scope.user = {},
        message = {
          "newUser":      "Your account has been created. Log in anytime.",
          "userUpdate":   "Your profile has been updated. "
        };

    var clearUserSignUpFields = function () {
      $scope.newUser = {};
    };

    $rootScope.showFlashMessage = function (type, message) {
      $rootScope.flash = {
        "type": type,
        "message": message
      };
      $rootScope.showFlash = true;
    }

    $rootScope.formatDate = function (date) {
      var dateArray = date.split("T")[0].split("-"),
          timeArray = date.split("T")[1].split(":"),
          dateString = dateArray[1] + "/" + dateArray[2] + "/" + dateArray[0].slice(2,4);
      dateString += " " + timeArray[0]%12 + ":" + timeArray[1];
      dateString += timeArray[0]/12 > 1 ? " PM" : " AM";
      return dateString;
    };

    $scope.signIn = $scope.howItWorks = $scope.recyclerSignUp =
    $scope.redeemerSignUp = $scope.userProfile = $rootScope.showFlash = false;

    $scope.toggleHowItWorks = function () {
      $scope.signIn = $scope.recyclerSignUp = $scope.redeemerSignUp = $scope.userProfile = false;
      $rootScope.showFlash = false;
      $scope.hideBanner = false;
      $scope.howItWorks = true;
      clearUserSignUpFields();
    };

    $scope.toggleSignIn = function () {
      $scope.howItWorks = $scope.recyclerSignUp = $scope.redeemerSignUp = false;
      $scope.hideBanner = false;
      $scope.signIn = true;
      clearUserSignUpFields();
    };

    $scope.toggleRedeemerSignUp = function () {
      $scope.signIn = $scope.howItWorks = $scope.recyclerSignUp = false;
      $scope.userProfile = false;
      $scope.redeemerSignUp = !$scope.redeemerSignUp;
    };

    $scope.toggleRecyclerSignUp = function () {
      $scope.signIn = $scope.howItWorks = $scope.redeemerSignUp = false;
      $scope.hideBanner = false;
      $scope.recyclerSignUp = true;
    };

    $scope.toggleUserProfile = function() {
      var id = $('#current_user_id').val(),
          self = this;
      $scope.howItWorks = false;
      $rootScope.showFlash = false;
      $scope.redeemerSignUp = false;
      $scope.userProfile = true;
      User.query(function (data) {
        for (var i = 0; i < data.length; i++) {
            if (parseInt(data[i].id) === parseInt(id) ) {
              self.user = data[i];
            }
        }
      });
    };

    $scope.closeProfileWorks = function () {
      $scope.howItWorks = $scope.userProfile = false;
      $scope.hideBanner = false;
    }

    $scope.closeJumboTron = function () {
      $scope.signIn = $scope.howItWorks =
      $scope.recyclerSignUp = $scope.redeemerSignUp =
      $scope.userProfile = false;
      $scope.hideBanner = false;
    };

    $scope.closeJumboTronSignedIn = function () {
      $scope.signIn = $scope.howItWorks =
      $scope.recyclerSignUp = $scope.redeemerSignUp =
      $scope.userProfile = false;
      $scope.hideBanner = false;
    };

    $scope.closeProfile = function () {
      $scope.signIn = $scope.howItWorks =
      $scope.recyclerSignUp = $scope.redeemerSignUp =
      $scope.userProfile = false;
      $scope.hideBanner = false;
    };

    $scope.addRecycler = function () {
      var newUser = $scope.newUser;
      newUser.function = $('#user_function').val();
      if (!newUser.group_id) {
        newUser.group_id = 2; // default to 'Public' group
      }
      if (newUser.function === 'redeemer') {
         newUser.radius = 8;
      }
      User.save(newUser);
      $rootScope.showFlashMessage("success", message.newUser);
      $scope.recyclerSignUp = false;
      $scope.redeemerSignUp = false;
      $scope.signIn = true;
      clearUserSignUpFields();
    };

    $scope.addRedeemer = function () {
      var newUser = $scope.newUser;
      newUser.function = $('#user_function').val();
      newUser.group_id = $('#admin_group_id').val();
      if (newUser.function === 'redeemer') {
         newUser.radius = 8;
      }
      User.save(newUser);
      clearUserSignUpFields();
      $scope.toggleRedeemerSignUp();
      $rootScope.showFlashMessage("success", message.newUser);
    };

    $scope.updateUser = function () {
      $scope.user.$update();
      $rootScope.showFlashMessage("success", message.userUpdate);
      $scope.howItWorks = false;
      $scope.userProfile = false;
    };

  }
]);
