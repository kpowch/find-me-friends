import React from 'react';
import ReactDOM from 'react-dom';
import Friend from './Friend'

console.log('am I in SuggestionList or some alternate reality')

class SuggestionList extends React.Component {

  constructor(props, _railsContext) {
    super(props);
    // How to set initial state in ES6 class syntax
    // https://facebook.github.io/react/docs/reusable-components.html#es6-classes
    console.log('props', props)
    this.state = {
      onRemove: this.props.onRemove
    };
    this.remove = this.remove.bind(this);
  }

  accept(friend) {
    console.log("SuggestionList accept fnxn")
    return function(e) {
      // event.preventDefault();
        console.log('this.props in SuggestionList accept', this.props);
        return this.props.onAccept(friend);
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
    return (
      <div className="suggestion-list">
        {this.props.friends ? this.props.friends.map(function(friend, i) {
          return <Friend
            friend={friend}
            onAccept={() => this.accept(friend)}
            onRemove={this.remove(friend)}
            key={i}
            />
          }, this
        ) : null}
      </div>
    );
  }
}
export default SuggestionList;