import React from 'react';
import ReactDOM from 'react-dom';
import Friend from './Friend'

console.log('am I in SuggestionList or some alternate reality')

class SuggestionList extends React.Component {

  remove(friend) {
    console.log('in suggestion-list remove function')
    console.log(this.props)

    return function(event) {
      event.preventDefault();
      return this.props.onRemove(friend);
    }.bind(this);
    $.ajax({
      data: friend,
      url: "/chatrooms",
      type: "DELETE",
      dataType: "json",
      success: console.log("you are so successful at deleting friends")
    });
  }

  accept(friend) {
    return function(event) {
      event.preventDefault();
        console.log(friend.friendship);
      $.ajax({
        data: {
          friendship: {
            id: friend.friendship_id,
            user_id: friend.current_user_id,
            friendship_status: "pending"
          }
        },
        url: "/friendships/" + friend.friendship_id,
        type: "PATCH",
        dataType: "json",
        success: console.log("Did we just become best friends?!?")
      });
    }
  }

  render() {
    return (
      <div className="suggestion-list">
        {this.props.friends ? this.props.friends.map(function(friend, i) {
          return <Friend
            friend={friend}
            onAccept={() => this.accept(friend)}
            onRemove={() => this.props.onRemove}
            key={i}
            />
          }
        ) : null}
      </div>
    );
  }
}
export default SuggestionList;