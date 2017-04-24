import React from 'react';
import ReactDOM from 'react-dom';
import Friend from './Friend'

class SuggestionList extends React.Component {

  render() {
    return (
      <div className="suggestion-list">
        {this.props.friends.map(function(friend) {
          return (<Friend name={friend}/>)
          }
        )}
      </div>
    );
  }
}

export default SuggestionList;