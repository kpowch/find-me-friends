import React from 'react';
import ReactDOM from 'react-dom';
import Friend from './Friend'

class SuggestionList extends React.Component {

  remove(friend) {
    return function(event) {
      event.preventDefault();
      return this.props.onRemove(friend);
    }.bind(this);
    $.ajax({
      data: friend.id,
      url: "/chatrooms",
      type: "DELETE",
      dataType: "json",
      success: console.log("you are so successful at deleting friends")
    });
  }

  accept(friend) {
    return function(event) {
      event.preventDefault();
      $.ajax({
        data: friend.id,
        url: "/chatrooms",
        type: "POST",
        dataType: "json",
        success: console.log("did we just become best friends?!?")
      });
    }
  }

  render() {
    var friends = this.props.friends.map(function(friend, i) {
    return (
      <li key={i} className="friend">
        <a href data-id={friend.id} className="remove-filter" onClick={this.remove(friend)}>REMOVE</a><br/>
        <a href data-id={friend.id} className="accept-filter" onClick={this.accept(friend)}>ACCEPTANCE IS GRANTED!</a>
        <h2 className="card-title">Meet:</h2>
        <div className="card-name">
          {friend.first_name}
        </div>
        <div className="card-name">
          {friend.last_name}
        </div>
        <img className="card-pic" src={friend.profile_picture}/>
        <div className="card-email">
          {friend.email}
        </div>
      </li>
    )
  }.bind(this));
  return <ul className="suggestion-list">{friends}</ul>;
  }
}
export default SuggestionList;