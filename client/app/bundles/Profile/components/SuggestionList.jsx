import React from 'react';
import ReactDOM from 'react-dom';
import Friend from './Friend'

class SuggestionList extends React.Component {

  remove(friend) {
    return function(event) {
      event.preventDefault();
      return this.props.onRemove(friend);
    }.bind(this);
  }

  render() {
    var friends = this.props.friends.map(function(friend, i) {
    return (
      <li key={i} className="friend">
        <a href data-id={friend.id} className="remove-filter" onClick={this.remove(friend)}>REMOVE</a>
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