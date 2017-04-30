import React from 'react';
import ReactDOM from 'react-dom';
import Friend from './Friend'

console.log('this is Pending motherfucker')

class Pending extends React.Component {

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

  remove(friend) {
    console.log("SuggestionList remove fnxn")
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

  render() {
    return this.props.pending.length ? this.props.pending.map(function(friend, i) {
      return <Friend
        friend={friend}
        onAccept={this.accept(friend)}
        onRemove={this.remove(friend)}
        key={i}
        />
      }, this
    ) : null;
  }
}
export default Pending;