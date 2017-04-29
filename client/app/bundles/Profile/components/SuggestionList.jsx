import React from 'react';
import ReactDOM from 'react-dom';
import Friend from './Friend'

console.log('am I in SuggestionList or some alternate reality')

class SuggestionList extends React.Component {

  remove(friend) {
    console.log('in suggestion-list remove function')
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
        console.log('do i have the friend:', friend);
      $.ajax({
        data: friend,
        url: "/chatrooms",
        type: "POST",
        dataType: "json",
        success: console.log("did we just become best friends?!?")
      });
    }
  }

  render() {
    return (
      <div>
        {this.props.friends ? this.props.friends.map(function(friend, i) {
          return <Friend
            friend={friend}
            onRemove={() => this.props.onRemove(friend)}
            key={i}
            />
          }
        ) : null}
      </div>
    );
  }
}
export default SuggestionList;